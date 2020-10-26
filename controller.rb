require_relative 'view'

class Controller

  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display
  end

  def create
    # ask user the recipe name
    name = @view.ask_recipe_name
    # ask user the recipe description
    description = @view.ask_recipe_description
    # create a new recipe
    new_recipe = Recipe.new(name, description)
    # Add recipe in cookbook
    @cookbook.add_recipe(new_recipe)
  end

  def destroy
    # show all recipes
    display
    # ask user the index to remove
    index = @view.ask_index
    # call remove from cookbook
    @cookbook.remove_recipe(index)
  end

  private

  def display
    # Get all recipes
    recipes = @cookbook.all
    # Call view with all recipes
    @view.display(recipes)
  end

end