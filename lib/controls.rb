# require 'gosu'

# module Controls
# 	PLAYER1 = {
# 		'a' => :left,
# 		'd' => :right,
#     'w' => :up,
#     's' => :down
# 	}

# 	def initialize(window, player, num)
# 		@window = window
# 		@player = player
# 		@keys = [PLAYER1, PLAYER2][num-1]
# 	end

# 	def update
# 		case matching_action
# 		when :left then @player.move_left if @player.move_left > left
# 		when :right then @player.move_right if @player.move_right < right
# 		end
# 	end

# 	def button_down(key)
# 		case @keys[key]
# 		when :left, :right then @player.move_right
# 		end
# 	end

# 	def button_up(key)
# 		@player.idle!
# 	end

# 	private

# 	def matching_action
# 		@keys.each do |key, action|
# 			if @window.button_down? 68
# 				return action
# 			end
# 		end
# 	end
# end