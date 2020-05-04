class View

  def show_recipes(recipes)
    recipes.each_with_index do |recipe, indice|
      # recipe é uma Recipe
      # puts recipe => <Recipe#127396786x...>
      puts "#{indice + 1}. #{recipe.name}: #{recipe.description}"
    end
  end

  def ask_user_for_name
    puts "What is the name of the recipe?"
    gets.chomp
  end

  def ask_user_for_desc
    puts "What is the description of the recipe?"
    gets.chomp
  end

  def ask_user_for_index
    puts "What is the position of the recipe?"
    gets.chomp.to_i - 1
  end

end
