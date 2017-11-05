require_relative '../lib/commands/create.rb'
require_relative '../lib/commands/clear.rb'
require_relative '../lib/commands/color.rb'
require_relative '../lib/commands/vertical.rb'
require_relative '../lib/commands/horizontal.rb'
require_relative '../lib/commands/show.rb'
require_relative '../lib/file_reader.rb'

class BitmapEditor

  def initialize
    @commands = {
      'I' => Create,
      'C' => Clear,
      'L' => Color,
      'V' => Vertical,
      'H' => Horizontal,
      'S' => Show
    }
  end

  def run(file_path)
    commands = FileReader.new(file_path).parse
    bitmap = nil

    commands.each do |command, argument|
      if bitmap.nil? && command != 'I'
        puts !@commands[command].nil? ? "No image" : "Invalid command"
      elsif @commands[command].nil?
        puts "unrecognised command #{command}"
      elsif !@commands[command].valid?(argument, bitmap)
        puts "Invalid argument #{argument} for #{command}"
      else
        bitmap = @commands[command].execute(argument, bitmap)
      end
    end

  end
end
