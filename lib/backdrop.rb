require 'gosu'

class Backdrop < Gosu::Image
  attr_accessor :stage

  def initialize(window, filename="assets/stages/11.png")
    @window = window
    @stage = '11'
    @tiles = ['11', '13', '14', '15', '21', '22', '23', '24', '33', '34', '42', '43', '52']
    @tile_hash = Hash.new
  end

  def change_stage(direction)
    if direction == 'left'
      if @tiles.include?("#{@stage[0].to_i-1}#{@stage[1]}")
        @stage = "#{@stage[0].to_i-1}#{@stage[1]}"
      end
    elsif direction == 'right'
      if @tiles.include?("#{@stage[0].to_i+1}#{@stage[1]}")
        @stage = "#{@stage[0].to_i+1}#{@stage[1]}"
      end
    elsif direction == 'up'
      if @tiles.include?("#{@stage[0]}#{@stage[1].to_i-1}")
       @stage = "#{@stage[0]}#{@stage[1].to_i-1}"
      end
    elsif direction == 'down'
      if @tiles.include?("#{@stage[0]}#{@stage[1].to_i+1}")
        @stage = "#{@stage[0]}#{@stage[1].to_i+1}"
      end
    end
  end


  def draw 
    Gosu::Image.new("assets/stages/#{@stage}.png", :tileable => true).draw(0, 0, 0, 3, 3)
  end
end