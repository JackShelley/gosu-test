require 'gosu'

class Projectile < Gosu::Image
  attr_accessor :stage

  def initialize(window)
    @window = window
    @projectile_image = Gosu::Image.new("assets/projectiles/fireball-right.png", :tileable => true)
    @firing = false
  end

  def firing?
    @firing
  end

  def fire
    @firing = true
  end


  def shoot(player_pos)
    x = player_pos[0]
    until x == 400
      @projectile_image.draw(x+=2, player_pos[1], 0, 1, 1)
    end
    @firing = false
  end

  def draw(player_pos)
    if @firing == true
      shoot(player_pos)
    end
  end

end