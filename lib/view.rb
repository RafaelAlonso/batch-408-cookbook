class View

  def show_recipes(recipes)
    recipes.each_with_index do |recipe, indice|
      # recipe é uma Recipe
      # puts recipe => <Recipe#127396786x...>
      puts "#{indice + 1}. #{recipe.name}: #{recipe.description}"
    end
  end

  def ask_user_for(info_needed)
    puts "What is the #{info_needed} of the recipe?"
    gets.chomp
  end

end
