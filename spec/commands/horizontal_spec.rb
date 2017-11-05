require_relative '../../lib/commands/horizontal.rb'
require_relative '../../lib/bitmap.rb'

describe Horizontal do
  describe '.execute' do
    it 'replace an x range of O to C in 3x2 matrix' do
      old_bitmap = Bitmap.new(3, 2)
      new_bitmap = Bitmap.new(3, 2)
      new_bitmap.matrix = [['O', 'C', 'C'], ['O', 'O', 'O']]

      expect(Horizontal.execute([2, 3, 1, 'C'], old_bitmap)).to eq(new_bitmap)
    end

    it 'replace an x range of O to C in 2x2 matrix' do
      old_bitmap = Bitmap.new(2, 2)
      new_bitmap = Bitmap.new(2, 2)
      new_bitmap.matrix = [['O', 'O'], ['C', 'C']]

      expect(Horizontal.execute([1, 2, 2, 'C'], old_bitmap)).to eq(new_bitmap)
    end

    context 'invalid argument' do
      it 'returns false when x is out of range' do
        old_bitmap = Bitmap.new(2, 3)

        expect(Horizontal.valid?([4, 5, 1, 'C'], old_bitmap)).to be false
      end

      it 'returns false when x is 0' do
        old_bitmap = Bitmap.new(2, 3)

        expect(Horizontal.valid?([0, 0, 1, 'C'], old_bitmap)).to be false
      end

      it 'returns false when x coordinates are not Integer' do
        old_bitmap = Bitmap.new(2, 3)

        expect(Horizontal.valid?([1, 'A', 'B', 'C'], old_bitmap)).to be false
      end
    end
  end
end
