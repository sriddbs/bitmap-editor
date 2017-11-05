require_relative '../../lib/commands/show.rb'
require_relative '../../lib/bitmap.rb'

describe Show do
  describe '.execute' do
    it 'outputs the 1x1 matrix' do
      bitmap = Bitmap.new(1, 1)
      message = "\"O\"\n"

      expect { Show.execute([], bitmap) }.to output(message).to_stdout
    end

    it 'outputs the 2x2 matrix' do
      bitmap = Bitmap.new(2, 2)
      message = "\"OO\"\n\"OO\"\n"
      
      expect { Show.execute([], bitmap) }.to output(message).to_stdout
    end
  end
end
