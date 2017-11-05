class Bitmap
  attr_accessor :columns, :rows, :matrix

  def initialize(columns, rows)
    @columns = columns
    @rows = rows
    @matrix = Array.new(rows) { Array.new(columns, 'O') }
  end

  def ==(other)
    raise "Object is not Bitmap #{other.class}" if self.class != other.class
    self.matrix == other.matrix
  end

  def reset
    Bitmap.new(columns, rows)
  end
end
