require_relative '../../lib/commands/color.rb'
require_relative '../../lib/bitmap.rb'

describe Color do
  let(:old_bitmap) { Bitmap.new(1, 2) }

  describe '.execute' do
    context 'correct coordinate' do
      new_bitmap = Bitmap.new(1, 2)

      it 'replace O to C at coordinate 1, 1' do
        new_bitmap.matrix = [['C'], ['O']]
        expect(Color.execute([1, 1, 'C'], old_bitmap)).to eq(new_bitmap)
      end

      it 'replace O to C at coordinate 1, 2' do
        new_bitmap.matrix = [['O'], ['C']]
        expect(Color.execute([1, 2, 'C'], old_bitmap)).to eq(new_bitmap)
      end
    end

    context 'invalid argument' do
      it 'returns false when no coordinate is provided' do
        expect(Color.valid?(['C'], old_bitmap)).to be false
      end

      it 'returns false when coordinate is not Integer' do
        expect(Color.valid?(['A', 'B', 'C'], old_bitmap)).to be false
      end

      it 'returns false when coordinate is out of bounds' do
        expect(Color.valid?([3, 4, 'C'], old_bitmap)).to be false
      end

      it 'returns false when coordinate is 0' do
        expect(Color.valid?([0, 0, 'C'], old_bitmap)).to be false
      end
    end
  end
end
