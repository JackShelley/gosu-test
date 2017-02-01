require 'gosu'

class Map < Gosu::Image

  def initialize(window)
    @window = window
    @current_tile = '11'
    @tiles = ['11', '12', '13', '21', '22',  '32', '42', '43']
    @tile_cords_x = {'1' => 530, '2' => 576,'3' => 622,'4' => 668,'5' => 714,'6' => 780,}
    @tile_cords_y = {'1' => 0, '2' => 35,'3' => 70,'4' => 105,'5' => 140,'6' => 175,}
    @tile_images = {}
  end

  def create_map
    @tiles.each do |tile|
      tile_image(tile).draw(@tile_cords_x[tile[0]], @tile_cords_y[tile[1]], 0, 3.5, 3.5)
    end
  end

  def current_tile
     Gosu::Image.new("assets/currentcell.png", :tileable => true).draw(@tile_cords_x[$stage[0]], @tile_cords_y[$stage[1]], 0, 3.3, 3.2)
  end

  def draw 
    current_tile
    create_map
  end

  private
  def tile_image(tile)
    @tile_images[tile] ||= Gosu::Image.new("assets/mapcell.png", :tileable => true)
  end
end
