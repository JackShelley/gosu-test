require 'gosu'

class Player
	attr_accessor :pos_x, :pos_y, :image, :frame

	SCALE = 2.55
	SPEED = 3

	def initialize(window, name, flip=false)
		@window = window

		if name == 'witch'
			@idle = Gosu::Image.load_tiles(window, 'assets/witch/down.png', 32, 32, false)[0..1]
			2.times {|x|@idle.insert(0, @idle.first)}
			2.times {@idle.insert(-1, @idle.last)}
			@left = Gosu::Image.load_tiles(window, 'assets/witch/left.png', 31, 31, false)[0..3]
			@right = Gosu::Image.load_tiles(window, 'assets/witch/right.png', 32, 32, false)[0..3]
			@up = Gosu::Image.load_tiles(window, 'assets/witch/up.png', 32, 32, false)[0..3]
			@down = Gosu::Image.load_tiles(window, 'assets/witch/down.png', 32, 32, false)[0..3]
		elsif name == 'wizard'
			@idle = (1...8).map do |i|
				(1..4).include?(i) ? (x = 1) : (x =2)
				Gosu::Image.new(window, "assets/wizard/forward#{x}.png", false)
			end
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
		end

		@pos_x = 70
		@pos_y = 150	
		@flip = flip
		@max_x = window.width

		@boundaries = [Boundary.new('11', 170, 110, 380, 210),Boundary.new('11', -20, -20, 50, 50)]
  end

  def define_operation(operation)
  	if operation == 'down y'
  		return @pos_y += 1
  	elsif operation == 'up y'
  		return @pos_y -= 1
  	elsif operation == 'down x'
  		return @pos_x -= 1
  	elsif operation == 'up x'
  		return @pos_x += 1
  	end
  end

	def move_to(x)
		@pos_x = x
	end

	def width
		@image.width * SCALE
	end


	def move_up
		@action = @up

		stop = false
		direction = nil

		@boundaries.each do |boundary|
			check = boundary.check_passability(@pos_x, @pos_y)
			if check[0] == true
				stop = true
				direction = check[1]
			end
		end

		if !stop	
			if @pos_y < -100
				$backdrop.change_stage('up')
				@pos_y = 500
			else
				@pos_y -= SPEED
			end
		else
			define_operation(direction)
		end
	end	

	def move_down
		@action = @down

		stop = false
		direction = nil

		@boundaries.each do |boundary|
			check = boundary.check_passability(@pos_x, @pos_y)
			if check[0] == true
				stop = true
				direction = check[1]
			end
		end

		if !stop 
			if @pos_y < 500
				@pos_y += SPEED
			elsif @pos_y >= 500
				$backdrop.change_stage('down')
				@pos_y = -100
			else
				@pos_y += 0
			end
		else
			define_operation(direction)
		end
	end

	def move_left
		@action = @left
		stop = false
		direction = nil

		@boundaries.each do |boundary|
			check = boundary.check_passability(@pos_x, @pos_y)
			if check[0] == true
				stop = true
				direction = check[1]
			end
		end

		if !stop
			if @pos_x > -100
				@pos_x -= SPEED
			elsif @pos_x < -60
				$backdrop.change_stage('left')
				@pos_x = @window.width
			else
				@pos_x += 0
			end
		else
			define_operation(direction)
		end
	end


	def move_right
		@action = @right
		stop = false
		direction = nil

		@boundaries.each do |boundary|
			check = boundary.check_passability(@pos_x, @pos_y)
			if check[0] == true
				stop = true
				direction = check[1]
			end
		end

		if !stop
			if @pos_x < @window.width 
				@pos_x += SPEED
			elsif @pos_x >= @window.width
				$backdrop.change_stage('right')
				@pos_x = -100
			else
				@pos_x += 0
			end
		else
			define_operation(direction)
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

