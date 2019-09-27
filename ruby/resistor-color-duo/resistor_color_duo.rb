module ResistorColorDuo
  VALUES = %w{black brown red orange yellow green blue violet grey white}
  def self.value(colours)
    colours.take(2).reduce(0) { |total, colour| total * 10 + VALUES.index(colour) }
  end
end
