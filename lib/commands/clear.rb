class Clear
  class << self
    def execute(argument, bitmap)
      bitmap.reset
    end

    def valid?(argument, bitmap)
      return false if bitmap.nil?
      true
    end
  end
end
