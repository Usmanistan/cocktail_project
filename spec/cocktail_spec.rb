require 'spec_helper'

describe Cocktail do 

  before :each do
    @cocktail = Cocktail.new("name", "recipe", :category)
  end
  
  describe "#new" do
    it "returns a new cocktail object" do
    	@cocktail.should be_an_instance_of Cocktail
    end

    it "throws an ArguementError when given less than three parameters" do 
    	lambda { Cocktail.new("name", "recipe") }.should raise_exception ArgumentError
    end
  end


  describe "#name" do
  	it "returns the correct name" do
  	  @cocktail.name.should eql "name"
    end
  end

  describe "#recipe" do
  	it "returns the correct recipe" do
  	  @cocktail.recipe.should eql ["recipe"]
    end
  end

  describe "#category" do
  	it "returns the correct category" do
  	  @cocktail.category.should eql :category
    end
  end 
end
