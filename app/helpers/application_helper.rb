module ApplicationHelper
  def chinese_pinyin(pinyin = "")
    "
    <div class='inline-block relative'>
      <svg class='w-full' viewBox='0 0 100 40' xmlns='http://www.w3.org/2000/svg'>
        <!-- 外框实线 -->
        <rect x='0' y='0' width='100' height='40' fill='none' stroke='#000' stroke-width='2'/>
        <!-- 中间两行虚线 -->
        <line x1='1' y1='15' x2='99' y2='15' stroke='#000' stroke-width='1' stroke-dasharray='3,3'/>
        <line x1='1' y1='30' x2='99' y2='30' stroke='#000' stroke-width='1' stroke-dasharray='3,3'/>
      </svg>
      <span class='absolute inset-0 mt-[1px] flex justify-center text-[var(--app-color-papper-pinyin,red)]'>#{pinyin}</span>
    </div>
    ".html_safe
  end

  def chinese_character(character = "")
    "
    <div class='inline-block relative'>
      <svg class='w-full' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'>
        <!-- 外框实线 -->
        <rect x='0' y='0' width='100' height='100' fill='none' stroke='#000' stroke-width='2'/>
        <!-- 垂直虚线 -->
        <line x1='50' y1='0' x2='50' y2='100' stroke='#000' stroke-width='1' stroke-dasharray='3,3'/>
        <!-- 水平虚线 -->
        <line x1='0' y1='50' x2='100' y2='50' stroke='#000' stroke-width='1' stroke-dasharray='3,3'/>
      </svg>
      <span class='absolute inset-0 p-1 flex items-center justify-center text-3xl text-[var(--app-color-papper-character,#ccc)]'>#{character}</span>
    </div>
    ".html_safe
  end

  def chinese_empty_character
    chinese_character
  end
end
