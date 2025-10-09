require "test_helper"

class ChineseTest < ActiveSupport::TestCase
  test "should convert Chinese characters to pinyin" do
    result = Chinese.to_pinyin("你好")

    assert_equal "nǐ hǎo", result
  end

  test "should handle empty string" do
    result = Chinese.to_pinyin("")

    assert_equal "", result
  end

  test "should handle non-Chinese characters" do
    result = Chinese.to_pinyin("hello world")

    assert_equal "hello world", result
  end

  test "should handle multiple Chinese characters" do
    result = Chinese.to_pinyin("你好世界")

    assert_equal "nǐ hǎo shì jiè", result
  end

  test "should handle mixed Chinese and English" do
    result = Chinese.to_pinyin("你好hello")

    assert_equal "nǐ hǎo hello", result
  end
end
