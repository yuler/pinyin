class Chinese
  def self.to_pinyin(chars)
    return chars if chars.nil? || chars.empty?
    Rails.benchmark("Chinese.to_pinyin") do
      runjs_pinyin_convert(chars)
    end
  end

  private_class_method def self.runjs_pinyin_convert(chars)
    context = MiniRacer::Context.new
    pinyin_js_path = Rails.root.join("vendor", "pinyin.min.js")

    # Load the pinyin.min.js library
    context.eval(File.read(pinyin_js_path))

    # Convert Chinese characters to pinyin
    # The pinyin library provides a pinyin() function
    result = context.eval("pinyin.pinyin('#{chars}', { style: 'pinyin.STYLE_TONE2' })")

    # Return as array of strings or join them
    result.is_a?(Array) ? result.join(" ") : result
  rescue => e
    Rails.logger.error "Error converting to pinyin: #{e.message}"
    chars # fallback to original text
  end
end
