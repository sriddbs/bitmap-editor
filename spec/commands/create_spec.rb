require_relative '../../lib/commands/create.rb'
require_relative '../../lib/bitmap.rb'

describe Create do
  describe '.execute' do

    it 'returns a 3x3 matrix' do
      matrix = Bitmap.new(3, 3)
      expect(Create.execute([3, 3], nil)).to eq(matrix)
    end

    it 'returns a 3x4 matrix' do
      matrix = Bitmap.new(3, 4)
      expect(Create.execute([3, 4], nil)).to eq(matrix)
    end

    context 'invalid argument' do
      it 'returns false when argument is an empty array' do
        expect(Create.valid?([], nil)).to be false
      end

      it 'returns false when argument is an array of non Integer' do
        expect(Create.valid?(["A", "B"], nil)).to be false
      end

      it 'returns false when column is out of bounds' do
        expect(Create.valid?([251, 1], nil)).to be false
      end

      it 'returns false when row is out of bounds' do
        expect(Create.valid?([1, 251], nil)).to be false
      end
    end
  end
end
