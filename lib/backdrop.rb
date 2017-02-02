require 'gosu'

class Backdrop < Gosu::Image
  attr_accessor :stage

  def initialize(window, filename="assets/tiles/11.png")
    @window = window
    $stage = '11'
    @tiles = ['11', '12', '13', '21', '22',  '32', '42', '43']
    @tile_hash = Hash.new
  end

  def change_stage(direction)
    if direction == 'left'
      if @tiles.include?("#{$stage[0].to_i-1}#{$stage[1]}")
        $stage = "#{$stage[0].to_i-1}#{$stage[1]}"
      end
    elsif direction == 'right'
      if @tiles.include?("#{$stage[0].to_i+1}#{$stage[1]}")
        $stage = "#{$stage[0].to_i+1}#{$stage[1]}"
      end
    elsif direction == 'up'
      if @tiles.include?("#{$stage[0]}#{$stage[1].to_i-1}")
       $stage = "#{$stage[0]}#{$stage[1].to_i-1}"
      end
    elsif direction == 'down'
      if @tiles.include?("#{$stage[0]}#{$stage[1].to_i+1}")
        $stage = "#{$stage[0]}#{$stage[1].to_i+1}"
      end
    end
  end

  def draw 
    Gosu::Image.new("assets/tiles/#{$stage}.png", :tileable => true).draw(0, 0, 0, 1.5, 1.5)
  end
end