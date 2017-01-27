require 'gosu'

class TextBox < Gosu::Image

  def initialize(window, text)
    @original_text = text
    @text = text
    @window = window

    @image = Gosu::Image.new(window, "assets/textbox.png", false)
    @medium_font = Gosu::Font.new(@window, "Alagard", 20)
    @output = []
  end

  def update_text
    current_last_letter = @text.length-1
    @output <<  @original_text[current_last_letter]
    @text = @output.join("")
  end

  def draw 
    pos_x = -20
    pos_y = 300
    # @image = @action[Gosu.milliseconds / 140 % @action.size]
    # @frame = Gosu.milliseconds / 140 % @action.size
    @image.draw(pos_x, pos_y, 1, 6, 6)
    draw_text(pos_x+200, pos_y+90, "#{@text}", @medium_font, 0xff_ffffffd1000)

  end
end