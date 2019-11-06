module Acronym
  def self.abbreviate(text)
    text
      .scan(/\b[[:alpha:]]/)
      .join
      .upcase
  end
end
