class Card
	attr_accessor :rank, :suit

	def initialize(rank, suit)
		@rank = rank
		@suit = suit
	end

	def to_s
		puts "#{rank}#{suit}"
	end
end

class Deck
	attr_accessor :deck_of_cards

	def initialize(number_of_decks)
		@deck_of_cards = []
		suits = ['s', 'h', 'd' , 'c']
		ranks = ['A','K','Q','J','10','9','8','7','6','5','4','3','2']

		ranks.each do |rank|
			suits.each do |suit|
				@deck_of_cards << Card.new(rank, suit)	
			end
		end
	@deck_of_cards = @deck_of_cards * number_of_decks
	@deck_of_cards.shuffle!
	end

	def deal_card
		deck_of_cards.pop
	end
end

class Hand
	attr_accessor :cards
	def initialize
		@cards = []
	end
end

class Player
end

class Blackjack
end

deck = Deck.new(1)
#deck.deck_of_cards.to_s
hand1 = Hand.new
hand1.cards << deck.deal_card
puts hand1.cards