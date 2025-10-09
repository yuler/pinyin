class CopiesController < ApplicationController
    def new
        @copy = Copy.new(copy_params)
        @copy.chinese = @copy.chinese.to_s.strip
        pinyin = Chinese.to_pinyin(@copy.chinese)
        chars = @copy.chinese.chars
        @copy.characters = pinyin.split(" ").map.with_index do |pinyin, index|
            [ pinyin, chars[index] ]
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
