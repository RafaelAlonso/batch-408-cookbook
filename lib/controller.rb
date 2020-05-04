require_relative 'view'
require_relative 'recipe'
require_relative 'scrape_bbc_good_food_service'

class Controller

  def initialize(repo)
    # controller precisa de algo para interagir com o usuário (view)
    @cookbook = repo

    # controller precisa das informações dos modelos que estamos guardando (repo)
    @view = View.new
  end

  def list
    # 1. pegar todas as receitas do repositório
    all_recipes = @cookbook.all
    # 2. mandar essas receitas para a view mostrar
    @view.show_recipes(all_recipes)
  end

  def create
    # 1. saber o nome da receita (String)
    name = @view.ask_user_for("name")
    # 2. saber a desc da receita (String)
    desc = @view.ask_user_for("description")
    # 3. saber a prep_time da receita (String)
    prep_time = @view.ask_user_for("preparation time")
    # 3. criar a receita com o nome e a desc
    new_recipe = Recipe.new(name, desc, prep_time)
    # 4. mandar A RECEITA para o repositorio guardar
    @cookbook.add_recipe(new_recipe)
  end

  def destroy
    # 0. listar as receitas que temos
    list
    # 1. saber qual receita eu quero destruir => recebendo o índice dessa receita
    recipe_index = @view.ask_user_for("position").to_i - 1
    # 2. mandar esse ínidice pro repositório destruir
    @cookbook.remove_recipe(recipe_index)
  end

  def import
    # Ask a user for a keyword to search
    ingredient = @view.ask_user_for("ingredient")
    difficulty = @view.ask_user_for("difficulty")

    # Chamar o serviço responsável por fazer o scrape
    service = ScrapeBbcGoodFoodService.new(ingredient, difficulty)
    imported_recipes = service.call

    # Display them in an indexed list
    @view.show_recipes(imported_recipes)

    # Ask the user which recipe they want to import (ask for an index)
    recipe_index = @view.ask_user_for("position").to_i - 1

    # Get the specified recipe from the imported recipes
    recipe_to_save = imported_recipes[recipe_index]

    # Add it to the Cookbook
    @cookbook.add_recipe(recipe_to_save)
  end

  def mark
    # 0. listar as receitas que temos
    list
    # 1. saber qual receita eu quero marcar => recebendo o índice dessa receita
    recipe_index = @view.ask_user_for("position").to_i - 1
    # 2. mandar esse ínidice pro repositório marcar
    @cookbook.mark_recipe(recipe_index)
  end

end
