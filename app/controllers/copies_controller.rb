class CopiesController < ApplicationController
    def new
        @copy = Copy.new(copy_params)
        @copy.chinese = @copy.chinese.to_s.strip
        pinyin_string = Chinese.to_pinyin(@copy.chinese).scan(/\S+| {2,}/)
        # Split by single space, but preserve multiple spaces (2+) as array elements
        pinyins = pinyin_string
        chars = @copy.chinese.chars
        puts pinyins.inspect
        puts chars.inspect
        @copy.characters = chars.map.with_index do |char, index|
            [ pinyins[index], char ]
        end
      # respond_to do |format|
      #     format.html
      #     format.turbo_stream
      # end
    end

    def create
    end

    def show
    end

    def edit
    end

    private


    def copy_params
        params.fetch(:copy, {}).permit(:chinese)
    end
end
