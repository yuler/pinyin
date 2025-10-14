class CopiesController < ApplicationController
    def new
        @copy = Copy.new(copy_params)
        chinese_normalized = @copy.chinese.to_s.gsub(/\s+/, " ").strip
        pinyin_string = Chinese.to_pinyin(chinese_normalized).scan(/\S+| {2,}/)
        # Split by single space, but preserve multiple spaces (2+) as array elements
        pinyins = pinyin_string
        chars = chinese_normalized.chars
        @copy.characters = pinyins.zip(chars)
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
