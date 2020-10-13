require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "-------------------------------------------------"
puts "Bienvenue sur 'ILS veulent tous ma POO' !"
puts "Le but du jeu est d'être le dernier survivant !"
puts "-------------------------------------------------"

puts ""

puts "Comment t'appelles-tu ?"
player_name = gets.chomp 

player = HumanPlayer.new(player_name)
player1 = Player.new("Josianne")
player2 = Player.new("José")

enemies = [player1, player2]

while player.life_points > 0 && (player1.life_points > 0 || player2.life_points >0)

puts player.show_state

puts "Quelle action veux-tu effectuer ? "
puts ""
puts "a - chercher une meilleure arme"
puts "b - chercher à se soigner"
puts ""
puts "attaquer un joueur en vue :"
if player1.life_points > 0
    puts "0 - #{player1.name} a #{player1.life_points} points de vie"
end
if player2.life_points > 0
	puts "1 - #{player2.name} a #{player2.life_points} points de vie"
end
puts ""

print ">"
choice = gets.chomp 

if choice == "a"
	player.search_weapon
elsif choice == "b"
	player.search_health_pack
elsif choice == "0"
	player.attacks(player1)
elsif choice == "1"
	player.attacks(player2)
end
		
if player.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
    puts ""
    puts "Les autres joueurs t'attaquent !"
    puts ""
 else 
    puts "__________________________________________________"
    puts ""
    puts "Bravo, tu as gagné !"
    puts "__________________________________________________"
    puts ""
end

enemies.each do |x|
    if x.life_points > 0
      x.attacks(player)
      puts ""
      x.show_state
      puts ""
      puts "Tour suivant"
      puts "__________________________________________________"
      puts ""
    end
  end


if player.life_points <= 0 
    puts "__________________________________________________"
    puts ""
    puts "Tu as perdu !!!"
    puts ""
    puts "__________________________________________________"
end

end



binding.pry