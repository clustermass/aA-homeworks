require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
subject(:dessert) { Dessert.new("cherry", 5, chef) }

  describe "#initialize" do

    it "sets a type" do
      expect(dessert.type).to eq("cherry")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(5)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{ Dessert.new("lemon","wine",chef) }.to raise_error(ArgumentError)
    end
  end


  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("lemon")
      expect(dessert.ingredients).to eq(["lemon"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.add_ingredient("sugar")
      dessert.add_ingredient("lemon")
      dessert.add_ingredient("honey")
      dessert.add_ingredient("nuts")

      dessert.mix!
      expect(dessert.ingredients).not_to eq(["sugar","lemon","honey","nuts"])

    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(3)
      expect(dessert.quantity).to eq(2)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{desert.eat(113)}.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef The Most Famous Mike")
      expect(dessert.serve).to eq("Chef The Most Famous Mike has made 5 cherries!")
      end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
