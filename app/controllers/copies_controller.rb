class CopiesController < ApplicationController
  PAPER_CHARACTER_LENGTH = 12 * 12

  def new
    @copy = Copy.new(copy_params)
    # Trim useless spaces
    trimmed = @copy.chinese.to_s.gsub(/\s+/, " ").strip
    # Split by single space, but preserve multiple spaces (2+) as array elements
    # "你好 世界" -> "nǐ hǎo   shì jiè" -> ["nǐ", "hǎo", "  ", "shì", "jiè"]
    pinyins = Chinese.to_pinyin(trimmed).scan(/\S+| {2,}/)
    chars = trimmed.chars
    zipped = pinyins.zip(chars)
    # Fill the rest to 100 with empty strings if chars less than 100
    if chars.length < PAPER_CHARACTER_LENGTH
      zipped += [ [ "", "" ] ] * (PAPER_CHARACTER_LENGTH - chars.length)
    end
    @copy.characters = zipped
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def create
  end

  def show
  end

  def edit
  end

  private
    def copy_params
      params.fetch(:copy, {}).permit(:chinese, :hidden_character).tap do |permit|
        permit[:hidden_character] = permit[:hidden_character].in?(%w[1 true yes on])
      end
    end
end
