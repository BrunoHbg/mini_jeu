class Game 

	attr_accessor :human_player , :enemies

	def initialize (name)
		@human_player = HumanPlayer.new(name)
		@enemies = []
		for x in 1..4
			@enemies.push(Player.new("player#{x}"))
		end
	end

	def kill_player
		@enemies.each do |gamer|
			if (gamer.life_points <=0)
				@enemies.delete(gamer)
			end
		end
	end

	def is_still_ongoing?
		if @human_player.life_points > 0 && @enemies.any? 
			return true
		else
			retun false
		end
	end

	def show_players
		@human_player.show_state
		puts "Il y a encore #{@enemies.count} ennemis en jeu."
	end

end