require 'gosu'

class TextBox < Gosu::Image

  def initialize(window, speaker, text, xpos, ypos)
    @original_text = text
    @speaker = speaker
    @xpos = xpos
    @ypos = ypos
    @original_text = text
    @window = window
    @image = Gosu::Image.new(window, "assets/textbox.png", false)
    @medium_font = Gosu::Font.new(@window, "Alagard", 20)
    @large_font = Gosu::Font.new(@window, "Alagard", 25)
    @output = []
    @counter = 0
    @showing = true
  end

  def reformat_wrapped(s, width=45)
    lines = []
    line = ""
    s.split(/\s+/).each do |word|
      if line.size + word.size >= width
        lines << line
        line = word
      elsif line.empty?
       line = word
      else
       line << " " << word
     end
     end
     lines << line if line
    return lines
  end

  def showing?
    @showing
  end

  def show
    @showing = true
  end

  def hide
    @showing = false
  end

  def update_text
    @counter += 1
    @text1 = @original_text[0..@counter][0...45]
    if @counter > 45 
      @text2 = @original_text[0..@counter][45..@counter][0...45]
      if @counter > 90 
        @text3 = @original_text[0..@counter][90..@counter][0...45]
      end
    end
  end

  def draw_name
    draw_text(95, 355, "#{@speaker}", @large_font, Gosu::Color::BLACK )
  end

  def draw 
    pos_x = -20
    pos_y = 300
    if showing?
      draw_name
      # @image = @action[Gosu.milliseconds / 140 % @action.size]
      # @frame = Gosu.milliseconds / 140 % @action.size
      @image.draw(pos_x, pos_y, 1, 6, 6)
      draw_text(95, 380, "#{@text1}", @medium_font, Gosu::Color::BLACK )
      draw_text(95, 400, "#{@text2}", @medium_font, Gosu::Color::BLACK )
      draw_text(95, 420, "#{@text3}", @medium_font, Gosu::Color::BLACK )
    end
  end
end