module ApplicationHelper
  def chinese_pinyin(pinyin = "")
    "
    <div class='inline-block relative'>
      <svg class='w-10' viewBox='0 0 100 33' xmlns='http://www.w3.org/2000/svg'>
        <!-- 外框实线 -->
        <rect x='1' y='1' width='96' height='33' fill='none' stroke='#000' stroke-width='2'/>
        <!-- 中间两行虚线 -->
        <line x1='1' y1='11' x2='96' y2='11' stroke='#000' stroke-width='1' stroke-dasharray='3,3'/>
        <line x1='1' y1='22' x2='96' y2='22' stroke='#000' stroke-width='1' stroke-dasharray='3,3'/>
      </svg>
      <span class='absolute w-10 top-0 left-0 text-xs text-center'>#{pinyin}</span>
    </div>
    ".html_safe
  end

  def chinese_character(character = "")
    "
    <div class='inline-block relative'>
      <svg class='w-10' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'>
        <!-- 外框实线 -->
        <rect x='1' y='1' width='96' height='96' fill='none' stroke='#000' stroke-width='2'/>
        <!-- 垂直虚线 -->
        <line x1='50' y1='1' x2='50' y2='96' stroke='#000' stroke-width='1' stroke-dasharray='3,3'/>
        <!-- 水平虚线 -->
        <line x1='1' y1='50' x2='96' y2='50' stroke='#000' stroke-width='1' stroke-dasharray='3,3'/>
      </svg>
      <span class='absolute top-0 left-0 w-full h-full'>#{character}</span>
    </div>
    ".html_safe
  end
end
