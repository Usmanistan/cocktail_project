require 'spec_helper'

describe "CocktailLibrary" do 

	before :all do
    cocktaillibrary_array = [
    	Cocktail.new("Ginger Ante", "Rum lime ginger/jaggery gingerbeer", :my_drinks),
    	Cocktail.new("Last Word", "gin lime maraschino chartreuse", :classics),
    	Cocktail.new("Kingston Club", "drambuie pineapple lime fernet angostura", :contemporary),
    	Cocktail.new("Bourbon Sour", "bourbon eggwhite lemon sugar", :classics)
    ]

    File.open "cocktails.yml", "w" do |f|
      f.write YAML::dump cocktaillibrary_array
    end
  end
 
  before :each do
      @cocktaillib = CocktailLibrary.new "cocktails.yml"
  end

  describe "#new" do
    context "with no parameters" do
      it "has no cocktails" do
        cocktaillib = CocktailLibrary.new
        cocktaillib.should have(0).cocktails #cocktaillib.cocktails.length.should == 0
      end
    end
    context "with a yaml file parameter" do
      it "has four cocktails" do
        @cocktaillib.should have(4).cocktails
      end
    end
  end

  describe "#get_cocktails_by_category" do
    it "returns all cocktails in given category" do
    	@cocktaillib.get_cocktails_by_category(:classics).length.should == 2
      #@cocktaillib.should have(2).get_cocktails_in_category(:development)
    end
  end

  describe "#get_cocktails_by_ingredient" do
  	it "returns all cocktails that have given ingredient" do
  	  @cocktaillib.get_cocktails_by_ingredient("lime").length.should == 3
  	  #@cocktaillib.should have(3).get_cocktails_by_ingredient("lime")
  	end
  end

  describe "#add_cocktail" do
  	it "accepts new cocktail" do
  		@cocktaillib.add_cocktail(Cocktail.new("Usman's Delight", "rye sweetvermouth bitters", :my_drinks))
  		@cocktaillib.get_cocktail("Usman's Delight").should be_an_instance_of Cocktail
  	end
  end

  describe "#save" do 
  	it "saves the cocktail library" do
  		cocktails = @cocktaillib.cocktails.map { |cocktail| cocktail.name }
  		@cocktaillib.save("our_new_library.yml")
  		cocktaillib2 = CocktailLibrary.new "our_new_library.yml"
  		cocktails2 = cocktaillib2.cocktails.map { |cocktail| cocktail.name }
  		cocktails.should eql(cocktails2)
  	end
  end
end





