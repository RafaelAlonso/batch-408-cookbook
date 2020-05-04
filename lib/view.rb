class View

  def show_recipes(recipes)
    recipes.each do |recipe|
      # recipe é uma Recipe
      # puts recipe => <Recipe#127396786x...>
      puts "#{recipe.name}: #{recipe.description}"
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

end
