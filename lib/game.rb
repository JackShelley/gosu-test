require 'gosu'

class Game < Gosu::Window 

	def initialize
		@screen_width = 480
		@screen_height = 680
		super(@screen_height, @screen_width, false)	
		self.caption = "Ruby RPG"

		@backdrop = Backdrop.new(self)
		@player1 = Player.new(self, "Ryu", false)
		@action_flag = false
		@current_action = @idle
		@frame_counter = 1
  	@large_font = Gosu::Font.new(self, "Alagard", @screen_height / 12)
	end

	def draw
		@backdrop.draw
		@player1.draw
    draw_text(@screen_width/2-@screen_width/4, 75, "Select Character", @large_font, 0xff_ffffff)
    draw_text(650, 170, "Computer Choice", @large_font, 0xff_fffff0f)
	end

	def button_down (id)
		close if id == Gosu::KbEscape
	end

	def button_up(key)
		@action = @idle
	end


	def update
		if @action_flag == true
		   @current_action
		   @frame_counter += 1
		   puts @frame_counter
		   if @frame_counter == 45
		   	@action_flag = false
		   	@current_action = @idle
		   	@frame_counter = 1
		   end
		else
		  if button_down? char_to_button_id("w")
			@player1.move_up
		  elsif button_down? char_to_button_id("s")
			@player1.move_down
		  elsif button_down? char_to_button_id("a")
			@player1.move_left
		  elsif button_down? char_to_button_id("d")
			@player1.move_right
		  else 
		 	@player1.idle
		 end
		end

	end
end

#public functions
#TextBox::font 'arial', 14
#TextBox::speed = 0.25
#TextBox::text = "Hello World! This is my append text awesome typewriter thingy. I'm just writing text to test this."
#TextBox::finish #Just print out the whole thing now

