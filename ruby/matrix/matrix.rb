class Matrix
  attr_reader :rows, :columns

  def initialize(text)
    @rows = text.split("\n").map do |row|
      row.split.map(&:to_i)
    end

    @columns = (0...@rows[0].length).map do |index|
      @rows.map { |row| row.at(index) }
    end
  end
end
