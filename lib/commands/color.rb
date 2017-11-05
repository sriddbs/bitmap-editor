class Color
  class << self
    def execute(argument, bitmap)
      column, row, color = argument
      column -= 1
      row -= 1
      bitmap.matrix[row][column] = color
      bitmap
    end

    def valid?(argument, bitmap)
      column, row, color = argument
      return false if argument.size != 3 || argument[0...-1].any? { |e| !e.is_a?(Integer) }
      return false if !(1..bitmap.columns).include?(column) || !(1..bitmap.rows).include?(row)
      true
    end
  end
end
