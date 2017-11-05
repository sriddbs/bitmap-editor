class Bitmap
  attr_reader :columns, :rows, :matrix

  def initialize(columns, rows)
    @columns = columns
    @rows = rows
    @matrix = Array.new(rows) { Array.new(columns, 'O') }
  end

  def ==(other)
    raise "Object is not Bitmap #{other.class}" if self.class != other.class
    self.matrix == other.matrix
  end
end
