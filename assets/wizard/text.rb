require 'gosu'

class TextBox < Gosu::Image

  def initialize(window, text)
    @text = text
    @window = window
  end

  def draw 
    pos_x = 20
    scale_x = 1
    # @image = @action[Gosu.milliseconds / 140 % @action.size]
    # @frame = Gosu.milliseconds / 140 % @action.size
    image.draw(@pos_x, @pos_y, 1, scale_x, SCALE)
  end
end