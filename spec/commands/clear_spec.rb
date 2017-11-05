require_relative '../../lib/commands/clear.rb'
require_relative '../../lib/bitmap.rb'

describe Clear do
  describe '.execute' do
    it 'reset the 1x1 matrix to original state' do
      old_matrix = Bitmap.new(1, 1)
      old_matrix.matrix = [['C']]
      new_bitmap = Bitmap.new(1, 1)
      expect(Clear.execute([], old_matrix)).to eq(new_bitmap)
    end

    it 'returns false when bitmap is nil' do
      expect(Clear.valid?([], nil)).to be false
    end
  end
end
