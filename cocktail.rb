class Cocktail
  attr_accessor :name, :recipe, :category

  def initialize(name, recipe, category)
  	@name = name
    @recipe = recipe.split
    @category = category
  end
end