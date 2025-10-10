class CopiesController < ApplicationController
    def new
        @copy = Copy.new(copy_params)
        @copy.chinese = @copy.chinese.to_s.strip
        # TODO: fix this
        @copy.hidden_character = @copy.hidden_character == "1" || @copy.hidden_character == true
        pinyin_string = Chinese.to_pinyin(@copy.chinese).scan(/\S+| {2,}/)
        # Split by single space, but preserve multiple spaces (2+) as array elements
        pinyins = pinyin_string
        chars = @copy.chinese.chars
        @copy.characters = chars.map.with_index do |char, index|
            [ pinyins[index], char ]
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
        params.fetch(:copy, {}).permit(:chinese, :hidden_character)
    end
end
