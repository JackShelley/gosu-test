require 'gosu'

class Backdrop < Gosu::Image

	def initialize(window, filename="assets/forest.jpg")
		super(window, filename, false)
	end

	def draw 
		super 0, 1, 0, 3, 3
	end
end