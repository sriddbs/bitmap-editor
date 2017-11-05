class FileReader
  attr_accessor :file

  def initialize file_path
    @file = File.open(file_path)
  end

  def parse
    contents = IO.readlines(@file)
    if @file.nil? || !File.exists?(@file) || contents.empty?
      puts "Please provide correct file"
    else
      commands = {}

      contents.each do |line|
        arguments = line.strip.split(' ')
        command = arguments.shift
        arguments = normalise(arguments)
        commands[command] = arguments
      end

      commands
    end
  end

  private

    def normalise(arguments)
      arguments.map do |value|
        value =~ /\d+/ ? value.to_i : value
      end
    end
end
