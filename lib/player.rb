class Player

	attr_accessor :name , :life_points


	def initialize (name)
		@name = name
		@life_points = 10

	end

	def show_state
		return "#{@name} a #{@life_points} points de vie"
	end

	def gets_damage (number_damage)
		@life_points = @life_points - number_damage 
		if life_points <= 0
			puts "Le joueur #{@name} a été tué" 
		end
	end

	def attacks (def_player)
		puts "Le joueur #{@name} attaque le joueur #{def_player.name} "
		@damage_inflict = compute_damage
		puts "Il lui inflige #{@damage_inflict} points de dommages"
		def_player.gets_damage(@damage_inflict)
	end

	def compute_damage
		return rand(1..6)
    end

end


class HumanPlayer < Player

	attr_accessor :weapon_level

	def initialize (name)
		@life_points = 100
		@weapon_level = 1
	end

	def show_state
		puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
	end

	def compute_damage
		rand(1..6) * @weapon_level
	end

	def search_weapon
		@new_weapon_level = rand(1..6)
		puts "Tu as trouvé une arme de niveau #{@new_weapon_level}"
		if @new_weapon_level > @weapon_level
			puts "Elle est meilleure que ton acienne arme, tu la prends !"
			@weapon_level = @new_weapon_level
		else @new_weapon_level <= @weapon_level
			puts "Elle n'est pas mieux que ton arme actuelle"
		end
	end

	def search_health_pack
		@health_pack = rand(1..6)
		if @health_pack == 1 
			puts "Tu n'as rien trouvé ..."
		elsif @health_pack > 1 && @health_pack < 6
			puts "Bravo tu as trouvé un pack de +50 points de vie !"
			@life_points += 50
            @life_points > 100? @life_points = 100 : @life_points
        elsif @number == 6
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
            @life_points += 80
            @life_points > 100? @life_points = 100 : @life_points
        end
    end
end



			
