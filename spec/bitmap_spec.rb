require_relative '../lib/bitmap.rb'

describe Bitmap do
  describe ".initialize" do
    before(:each) do
      @bitmap = Bitmap.new(4, 5)
    end

    it "initializes with MxN matrix" do
      expect(@bitmap.rows).to eql(5)
      expect(@bitmap.columns).to eql(4)
    end

    it "initializes with default color 'Ó'" do
      expect(@bitmap.matrix.map { |e| e }.flatten.uniq).to eql(["O"])
    end
  end
end
