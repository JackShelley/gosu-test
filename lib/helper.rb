require 'gosu'

def draw_text(x, y, text, font, color)
  font.draw(text, x, y, 3, 1, 1, color)
end


def check_passability(stage, player_x, player_y, x, y, lengthx, lengthy)
  square = create_area(x, y, lengthx, lengthy)
  midpoint = [median(square[0]),median(square[1])]

  if square[0].include?(player_x) && square[1].include?(player_y)
    boolean = true
  else
    boolean = false
  end

  if player_y < midpoint[1]-lengthy/2 + 10
      return [boolean, 'up y']
  elsif (midpoint[1]+lengthy/2 - 10..700).include?(player_y) 
      return [boolean, 'down y']
  else
    if player_x < midpoint[0]
      p 'down x'
      return [boolean, 'down x']
    else
      p 'up x'      
      return [boolean, 'up x']
    end
  end
end

def create_area(x, y, xlength, ylength)
  return [(x..x+xlength),(y..y+ylength)]
end

def median(array)
  sorted = array.sort
  len = sorted.length
  (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
end