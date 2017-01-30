require 'gosu'

class Map < Gosu::Image

  def initialize(window)
    @window = window
    @tiles = ['11', '13', '14', '15', '21', '22', '23', '24', '33', '34', '42', '43', '52']
    @tile_cords_x = {'1' => 530, '2' => 576,'3' => 622,'4' => 668,'5' => 714,'6' => 780,}
    @tile_cords_y = {'1' => 0, '2' => 35,'3' => 70,'4' => 105,'5' => 140,'6' => 175,}
    
  end

  def create_map
    @tiles.each do |tile|
      Gosu::Image.new("assets/mapcell.png", :tileable => true).draw(@tile_cords_x[tile[0]], @tile_cords_y[tile[1]], 0, 3.5, 3.5)
    end
  end

  def draw 
    # Gosu::Image.new("assets/mapcell.png", :tileable => true).draw(550, 0, 0, 3, 3)
    create_map
  end
end