class English
  def self.to_phonetic(chars)
    return chars if chars.nil? || chars.empty?
    Rails.benchmark("english#to_phonetic") do
      runjs_phonetic_convert(chars)
    end
  end
end
