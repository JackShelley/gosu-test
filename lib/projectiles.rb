require 'gosu'

class Projectile < Gosu::Image
  attr_accessor :pos_y, :pos_x, :direction

  SPEED = 15

  def initialize(window)
    @window = window
    @projectile_right = Gosu::Image.new("assets/projectiles/fireball-right.png", :tileable => true)
    @projectile_left = Gosu::Image.new("assets/projectiles/fireball-left.png", :tileable => true)
    @projectile_up = Gosu::Image.new("assets/projectiles/fireball-up.png", :tileable => true)
    @projectile_down = Gosu::Image.new("assets/projectiles/fireball-down.png", :tileable => true)
    @projectile_image = @projectile_right
    @firing = false
    @pos_x = 100
    @pos_y = 200
    @firing = false
    @show = 0
    @direction = 'down'
    @override = false
  end

  def move_right(playerx, playery)
    if @pos_x > @window.width || @pos_x < 0 || @pos_y > @window.height || @pos_y < 0  
      @pos_x = 100
      $fire = false
      @override = false
    end

    if $fire == true 
      @show = 1.5 
      if @override 
        if @override == 'right'
          @pos_x += 10
        elsif @override == 'left'
          @pos_x -= 10
        elsif @override == 'up'
          @pos_y -= 10
        elsif @override == 'down'
          @pos_y += 10
        end
      elsif @direction == 'right'
        @projectile_image = @projectile_right
        @override = 'right'
      elsif @direction == 'left'
        @projectile_image = @projectile_left
        @override = 'left'
      elsif @direction == 'up'
        @projectile_image = @projectile_up
        @override = 'up'
      elsif @direction == 'down'
        @projectile_image = @projectile_down
        @override = 'down'
      end
    else
      @show = 0
      @pos_x = playerx+20
      @pos_y = playery+20
      @override = nil
    end
  end

  def draw(playerx, playery)
    move_right(playerx, playery)

    @projectile_image.draw(@pos_x, @pos_y, 0, @show, 1.5)
  end

end