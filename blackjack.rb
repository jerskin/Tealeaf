def calculate_hand_total(hand)
	hand_ranks = []
	
	hand.each do |r,s|
		hand_ranks << r
	end

	total = 0
	hand_ranks.each do |rank|
		if ['K', 'Q', 'J'].include? rank
			total += 10
		elsif rank == 'A'
			total += 11
		else
			total += rank.to_i
		end
	end

	hand_ranks.select{ |r| r == 'A' }.count.times do
		total -= 10 if total > 21
	end

	return total

end

# puts "Please enter your name:"
# player_name = gets.chomp

play_again = true
player_busted = false

while play_again	
	puts ""
	puts "Hi! Welcome to Blackjack! Shuffling cards..."
	puts ""

	card_rank = ['A','K','Q','J','10','9','8','7','6','5','4','3','2']
	card_suit = ['s','h','c','d']

	deck = []
	card_rank.each do |rank|
		card_suit.each do |suit|
			deck << [rank, suit]
		end
	end

	player_hand = []
	dealer_hand = []

	#Shuffle up and deal
	deck.shuffle!

	2.times do
		player_hand << deck.pop
		dealer_hand << deck.pop
	end

	player_total = calculate_hand_total(player_hand)
	dealer_total = calculate_hand_total(dealer_hand)

	puts "Player has: #{player_hand[0][0]}#{player_hand[0][1]} #{player_hand[1][0]}#{player_hand[1][1]} for a total of #{player_total}."
	puts "Dealer shows: #{dealer_hand[0][0]}#{dealer_hand[0][1]}"
	puts ""
	
	if player_total == 21
			if dealer_total == 21
				puts "YOU AND THE DEALER BOTH HAVE BLACKJACK.  PUSH."
			else	
				puts	"CONGRATULATIONS!  YOU HIT BLACKJACK!"
			end
	end

	while player_total < 21

		if dealer_total == 21
			puts "DEALER HAS BLACKJACK."
			break
		end

		puts "*** Please select your action: H (hit) or S (stay)"
		player_action = gets.chomp

		if player_action.upcase == 'H'
			player_hand << deck.pop
			player_total = calculate_hand_total(player_hand)

			puts ""
			puts "===> You were dealt the #{player_hand.last[0]}#{player_hand.last[1]}."
			puts ""

			print "Player has: "
			player_hand.each { |r,s| print r+s+ " "} 
			puts "for a total of #{player_total}."
			puts ""

			if player_total > 21
				puts "YOU BUSTED!  GAME OVER."
				player_busted = true
				break
			end
		elsif player_action.upcase == 'S'
			break
		else
			puts "Invalid command. Please enter H or S."
		end
	end

	puts ""
	puts "Dealer shows #{dealer_hand[0][0]}#{dealer_hand[0][1]} #{dealer_hand[1][0]}#{dealer_hand[1][1]} for a total of #{dealer_total}."


	unless player_busted
		while dealer_total < 17
			dealer_hand << deck.pop
			dealer_total = calculate_hand_total(dealer_hand)

			puts ""
			puts "===> Dealer draws the #{dealer_hand.last[0]}#{dealer_hand.last[1]} for a total of #{dealer_total}."
		end
	end

	puts ""
	puts "Player has: #{player_total}"
	puts "Dealer has: #{dealer_total}"
	puts ""

	if (player_total > dealer_total && player_total <= 21) || (player_total <= 21 && dealer_total > 21)
		puts "CONGRATULATIONS YOU WON!!!!!!!"
	elsif player_total < dealer_total && dealer_total <= 21
		puts "SORRY, CHARLIE. BETTER LUCK NEXT TIME."
	elsif player_total == dealer_total && player_total <=21 
		puts "PUSH."
	end

	puts "Would you like to play again? Y for Yes"
	  if gets.chomp.upcase == "Y"
	  	system('clear')
		  next 
		else 
			play_again = false
		end
end

