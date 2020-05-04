require 'csv'
require_relative 'recipe'

# PARSING / STORING
#  load   /  save


class Cookbook

  def initialize(csv_file_path)
    # csv_file_path => String do caminho até o arquivo
    @recipes = []

    @csv_file = csv_file_path

    # load in initialize
    load_csv
  end

  def all
    # entrega todas as receitas que estou guardando
    @recipes
  end

  def add_recipe(new_recipe)
    @recipes << new_recipe

    # salvar as receitas no csv
    save_csv
  end

  def remove_recipe(recipe_index)
    # delete_at remove um elemento da array baseado no ínidice dele
    @recipes.delete_at(recipe_index)

    # salvar as receitas no csv
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file) do |row|
      # cada linha do meu CSV (como Array)
      # row na primeira vez => ['lasanha', 'bom demais']

      # preciso transformar minha Array de Strings em Recipe
      recipe_from_csv = Recipe.new(row[0], row[1])
      # guardar a Recipe em @recipes
      @recipes << recipe_from_csv
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      # csv é todo o meu arquivo

      # para cada uma das receitas que eu tenho
      @recipes.each do |recipe|
        # preciso transformar minha Recipe em Array de Strings
        recipe_as_array = [recipe.name, recipe.description]

        # preciso guardar a Array de Strings em CSV
        csv << recipe_as_array
      end
    end
  end

end
