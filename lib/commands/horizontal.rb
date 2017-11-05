class Horizontal
  class << self
    def execute(argument, bitmap)
      column_min, column_max, row, colour = argument
      column_min -= 1
      column_max -= 1
      row -= 1
      draw_horizontal(column_min, column_max, row, colour, bitmap)
    end

    def valid?(argument, bitmap)
      column_min, column_max, row, colour = argument
      return false if argument[0...-1].any? { |e| !e.is_a?(Integer) }
      return false if column_min < 1 || column_max > bitmap.columns
      true
    end

    private

    def draw_horizontal(column_min, column_max, row, colour, bitmap)
      selected_row = bitmap.matrix[row]
      selected_row.each_with_index do |value, index|
        selected_row[index] = colour if (column_min..column_max).include?(index)
      end
      bitmap
    end
  end
end
