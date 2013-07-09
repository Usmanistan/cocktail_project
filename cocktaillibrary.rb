require 'yaml'
require_relative 'cocktail' 


class CocktailLibrary

  attr_accessor :name, :cocktails, :category, :recipe

  def initialize(lib_file = false)
    @lib_file = lib_file
    @cocktails = @lib_file ? YAML::load(File.read(@lib_file)) : []
  end

  def get_cocktails_by_category(category)
    display_coctails(@cocktails.select { |cocktail| cocktail.category == category })
  end

  def add_cocktail(cocktail)
    @cocktails << cocktail
  end

  def get_cocktail(name)
    display_coctails(@cocktails.select { |cocktail| cocktail.name == name })
  end

  def get_cocktails_by_ingredient(ingredient)
    display_coctails(@cocktails.select { |cocktail| cocktail.recipe.include?(ingredient) })
  end

  def display_all_cocktails
    display_coctails(@cocktails) 
  end

  def save lib_file = false
    @lib_file = lib_file || @lib_file || "library.yml"
    File.open @lib_file, "w" do |f|
      f.write YAML::dump @cocktails
    end
  end

  private

  def display_coctails(resulting_array)
    resulting_array.each do |cocktail|  
      puts "Cocktail Name: #{cocktail.name}
       Recipe: #{cocktail.recipe.join(', ')}
     Category: #{cocktail.category}"
    end
  end

end

cocktaillibrary_array = [
  Cocktail.new("Ginger Ante", "Rum lime ginger/jaggery gingerbeer", :my_drinks),
  Cocktail.new("Last Word", "gin lime maraschino chartreuse", :classics),
  Cocktail.new("Kingston Club", "drambuie pineapple lime fernet angostura", :contemporary),   
  Cocktail.new("Bourbon Sour", "bourbon eggwhite lemon sugar", :classics)
]

File.open "cocktails.yml", "w" do |f|
  f.write YAML::dump cocktaillibrary_array
end
my_cocktails = CocktailLibrary.new("cocktails.yml")
#my_cocktails.display_all_cocktails
#my_cocktails.get_cocktails_by_ingredient("bourbon")
#p my_cocktails.get_cocktails_in_category(:classics)
my_cocktails.get_cocktail("Last Word")

