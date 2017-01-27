require 'gosu'

class Game < Gosu::Window 

	def initialize
		@screen_width = 480
		@screen_height = 680
		super(@screen_height, @screen_width, false)	
		self.caption = "Ruby RPG"

		@backdrop = Backdrop.new(self)
		@player1 = Player.new(self, "witch", false)
		@player2 = Player.new(self, "wizard", false)

		@text = TextBox.new(self, 'I am the greate Slagathor Merrysmith Tomnook Riverbrandy the Wizard. Fight me.')

		@action_flag = false
		@current_action = @idle
		@frame_counter = 1
  	@large_font = Gosu::Font.new(self, "Alagard", @screen_height / 12)
  	@medium_font = Gosu::Font.new(self, "Alagard", @screen_height / 20)
	end

	def draw
		@backdrop.draw
		@player1.draw
		draw_text(0, 0, "#{@player1.pos_x}, #{@player1.pos_y}", @medium_font, 0xff_ffffffd1000)
		@player2.draw
    draw_text(@screen_width/2-@screen_width/4, 75, "Select Character", @large_font, 0xff_ffffff)

    @text.draw
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
			elsif button_down?char_to_button_id("i")
			@player2.move_up
		  elsif button_down? char_to_button_id("k")
			@player2.move_down
		  elsif button_down? char_to_button_id("j")
			@player2.move_left
		  elsif button_down? char_to_button_id("l")
			@player2.move_right
			elsif button_down? char_to_button_id("t")
			@text.update_text
		  else 
		 	@player1.idle
		 	@player2.idle
		 end
		end

	end
end

#public functions
#TextBox::font 'arial', 14
#TextBox::speed = 0.25
#TextBox::text = "Hello World! This is my append text awesome typewriter thingy. I'm just writing text to test this."
#TextBox::finish #Just print out the whole thing now

