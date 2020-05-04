require 'open-uri'
require 'nokogiri'
require_relative 'recipe'

class ScrapeBbcGoodFoodService # or ScrapeMarmitonService
  def initialize(keyword, difficulty)
    @keyword = keyword
    @difficulty = difficulty
  end

  def call
    # Make an HTTP request to the recipe’s website with our keyword
    url = "https://www.bbcgoodfood.com/search/recipes?query=#{@keyword}"
    html_file = open(url).read # HTTP Request

    # Parse the HTML document
    doc = Nokogiri::HTML(html_file)

    # extract the first 5 recipes suggested
    result = doc.search('.node.node-recipe.node-teaser-item.clearfix') # doc.search returns an Array

    # filter the result by their difficulty
    diff_result = result.select do |element|
      recipe_diff = element.search('.teaser-item__info-item.teaser-item__info-item--skill-level').text.strip
      recipe_diff.downcase == @difficulty
    end


    # store them in an Array
    diff_result.first(5).map do |element|
      recipe_name = element.search('.teaser-item__title a').text.strip
      recipe_desc = element.search('.field-item.even').text.strip
      recipe_prep = element.search('.teaser-item__info-item.teaser-item__info-item--total-time').text.strip

      Recipe.new(recipe_name, recipe_desc, recipe_prep)
    end
  end
end
