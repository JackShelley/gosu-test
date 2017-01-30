require 'gosu'

class Game < Gosu::Window 

	def initialize
		@screen_width = 534
		@screen_height = 768
		super(@screen_height, @screen_width, false)	
		self.caption = "Ruby RPG"
		@thing = false
		$backdrop = Backdrop.new(self)
		@player1 = Player.new(self, "witch", false)
		# @player2 = Player.new(self, "wizard", false)
		@map = Map.new(self
			)
		@text = TextBox.new(self, 'Wizard' , 'I am the great Slagathor Merrysmith Tomnook R-iverbrandy the Wizard. Fight me. FIGHT ME FIGHT ME FIGHT ME FIGHT ME FIGHT ME FIGHT...', 75, 400)

		@frame_counter = 0
  	@large_font = Gosu::Font.new(self, "Alagard", @screen_height / 12)
  	@medium_font = Gosu::Font.new(self, "Alagard", @screen_height / 20)
	end

	def draw
		$backdrop.draw
		@player1.draw
		draw_text(0, 0, "#{@player1.pos_x}, #{@player1.pos_y}", @medium_font, 0xff_ffffffd1000)
		# @player2.draw
		@map.draw
    if @text.showing?
    	@text.draw
    end
	end

	def button_down (id)
		close if id == Gosu::KbEscape
	end

	def button_up(key)
		@action = @idle
	end

	def in_range?(player, xrange, yrange)
	  xrange.include?(@player1.pos_x) && yrange.include?(@player1.pos_y)
	end

	def update
		@frame_counter += 1
	  if button_down? char_to_button_id("w")
		@player1.move_up
	  elsif button_down? char_to_button_id("s")
		@player1.move_down
	  elsif button_down? char_to_button_id("a")
		@player1.move_left
	  elsif button_down? char_to_button_id("d")
		@player1.move_right
		elsif button_down?char_to_button_id("i")
		# @player2.move_up
	  elsif button_down? char_to_button_id("k")
		# @player2.move_down
	  elsif button_down? char_to_button_id("j")
		# @player2.move_left
	  elsif button_down? char_to_button_id("l")
		# @player2.move_right
		elsif button_down? char_to_button_id("t")
			if in_range?(@player1, (100..200), (100..200))
				@text.show
				@thing = true	
			end
	  else 
	 	@player1.idle
	 	# @player2.idle
	 end

	 if !in_range?(@player1, (100..200), (100..200))
			@text.hide
	 end

	 if @thing && @frame_counter%2==0
		 @text.update_text
	 end
	end
end
