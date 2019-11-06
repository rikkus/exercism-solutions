module Hamming
  def self.distance(strand1, strand2)
    if strand1.size != strand2.size
      raise ArgumentError.new("Strands must be of equal length")
    end

    strand1.codepoints.zip(strand2.codepoints).count { |a, b| a != b }
  end
end
