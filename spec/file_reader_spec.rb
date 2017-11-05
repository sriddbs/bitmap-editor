require_relative '../lib/file_reader.rb'

describe FileReader do
  describe '.initialize'do
    it 'initializes with file' do
      file_path = './spec/fixtures/test.txt'

      f = FileReader.new(file_path)

      expect(File.basename(f.file)).to eql(File.basename(file_path))
    end
  end

  describe '.parse' do
    context 'incorrect file' do
      it 'outputs error message' do
        message = "Please provide correct file\n"
        expect { FileReader.new('./lib/test.txt').parse() }.to output(message).to_stdout
      end
    end

    context 'correct file' do
      it 'returns the command from text file' do
        file_path = './spec/fixtures/test.txt'
        commands = {
          'I'=> [2, 3] ,
          'L'=> [2, 2, 'A'],
          'S'=> []
        }
        expect(FileReader.new(file_path).parse()).to eq(commands)
      end
    end
  end
end
