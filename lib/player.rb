require 'gosu'

class Player
	attr_accessor :pos_x, :pos_y, :image, :frame

	SCALE = 2.55
	SPEED = 3

	def initialize(window, name, flip=false)

		@idle = (1...8).map do |i|
			(1..4).include?(i) ? (x = 1) : (x =2)
			Gosu::Image.new(window, "assets/wizard/forward#{x}.png", false)
		end

	  @tileset = Gosu::Image.load_tiles(window, 'assets/soldier_sheet.png', 8, 8, false)
		
    # @down = @tileset.first
    # @right = @tileset[1]
    # @left = @tileset[2]
    # @up = @tileset.last


		@down = (1...3).map do |i|
			Gosu::Image.new(window, "assets/wizard/forward#{i}.png", false)
		end
		@up = (1...3).map do |i|
			Gosu::Image.new(window, "assets/wizard/back#{i}.png", false)
		end
		@left = (1...3).map do |i|
			Gosu::Image.new(window, "assets/wizard/left#{i}.png", false)
		end
		@right = (1...3).map do |i|
			Gosu::Image.new(window, "assets/wizard/right#{i}.png", false)
		end

		@pos_x = 70
		@pos_y = 150	
		@flip = flip
		@max_x = window.width
	end

	def move_to(x)
		@pos_x = x
	end

	def width
		@image.width * SCALE
	end

	def move_left
		@action = @left
		if @pos_x > -100
			@pos_x -= SPEED
		else
			@pos_x += 0
		end
	end

	def move_up
		@action = @up
		if @pos_y < 500
			@pos_y -= SPEED
		else
			@pos_y -= 0
		end
	end	

	def move_down
		@action = @down
		if @pos_y < 500
			@pos_y += SPEED
		else
			@pos_y += 0
		end
	end

	def move_right
		@action = @right
		if @pos_x < 500
			@pos_x += SPEED
		else
			@pos_x += 0
		end
	end

	def idle
		@action = @idle
	end


	def draw 
		pos_x = @pos_x + (@flip ? width : 0)
		scale_x = SCALE * (@flip ? -1 : 1)

		@image = @action[Gosu.milliseconds / 140 % @action.size]
		@frame = Gosu.milliseconds / 140 % @action.size
		image.draw(@pos_x, @pos_y, 1, scale_x, SCALE)
	end
end

