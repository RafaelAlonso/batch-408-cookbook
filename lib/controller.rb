require_relative 'view'
require_relative 'recipe'

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
    name = @view.ask_user_for_name
    # 2. saber a desc da receita (String)
    desc = @view.ask_user_for_desc
    # 3. criar a receita com o nome e a desc
    new_recipe = Recipe.new(name, desc)
    # 4. mandar A RECEITA para o repositorio guardar
    @cookbook.add_recipe(new_recipe)
  end

  def destroy
  end

end
