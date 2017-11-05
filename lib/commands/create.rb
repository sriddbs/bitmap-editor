require_relative '../bitmap.rb'

class Create
  class << self
    def execute(argument, bitmap)
      column, row = argument
      Bitmap.new(column, row)
    end

    def valid?(argument, bitmap)
      column, row = argument
      return false if argument.length != 2 || argument.any? { |e| !e.is_a?(Integer) }
      return false if !(1..250).include?(column) || !(1..250).include?(row)
      true
    end
  end
end
