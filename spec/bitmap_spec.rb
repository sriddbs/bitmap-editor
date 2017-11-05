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

  let(:bitmap2x2) { Bitmap.new(2, 2)}
  let(:bitmap2x3) { Bitmap.new(2, 3)}

  describe '#reset' do
    it 'clears the 2x2 matrix to original state' do
      bitmap2x2.matrix = [['C', 'C'], ['C', 'C']]
      new_bitmap = Bitmap.new(2, 2)

      expect(bitmap2x2.reset).to eq(new_bitmap)
    end

    it 'clears the 2x3 matrix to original state' do
      bitmap2x3.matrix = [['C', 'C'], ['C', 'C'], ['O', 'O']]
      new_bitmap = Bitmap.new(2, 3)

      expect(bitmap2x3.reset).to eq(new_bitmap)
    end
  end

  describe '#==' do
    it 'not equals when 2 matrices are not the same side' do
      expect(bitmap2x2).not_to eq(bitmap2x3)
    end

    it 'equals when 2 matrices are the same side' do
      new_bitmap = Bitmap.new(2, 2)

      expect(bitmap2x2).to eq(new_bitmap)
    end
  end
end
