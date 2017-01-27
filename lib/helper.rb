require 'gosu'

def draw_text(x, y, text, font, color)
  font.draw(text, x, y, 3, 1, 1, color)
end