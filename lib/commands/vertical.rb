class Vertical
  class << self
    def execute(argument, bitmap)
      column, row_min, row_max, color = argument
      column -= 1
      row_min -= 1
      row_max -= 1
      draw_vertical(column, row_min, row_max, color, bitmap)
    end

    def valid?(argument, bitmap)
      column, row_min, row_max, color = argument
      return false if argument[0...-1].any? { |e| !e.is_a?(Integer) }
      return false if row_min < 1 || row_max > bitmap.rows
      true
    end

    private

    def draw_vertical(column, row_min, row_max, color, bitmap)
      bitmap.matrix.each_with_index do |array, index|
        array[column] = color if (row_min..row_max).include?(index)
      end
      bitmap
    end
  end
end
