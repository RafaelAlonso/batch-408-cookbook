class Cookbook

  def initialize(x)
    @recipes = []
  end

  def all
    # entrega todas as receitas que estou guardando
    @recipes
  end

  def add_recipe(new_recipe)
    @recipes << new_recipe
  end

  def remove_recipe(recipe_index)
    # delete_at remove um elemento da array baseado no ínidice dele
    @recipes.delete_at(recipe_index)
  end

end
