class Deck
	attr_reader :cards, :file

	def initialize(file)
		@file = file
		@cards = parse
	end

	def parse
		text = File.open(file, "rb").read
		text = text.split("\n")
		text.delete("")
		a = 0
		b = 1
		cards = []
		(text.length / 2).times do
			cards << Card.new(text[a], text[b])
			a += 2
			b += 2
		end
		cards
	end

end

class Card
	attr_reader :question, :answer

	def initialize(question, answer)
		@question = question
		@answer   = answer
	end

end

class Flashcards
	attr_reader :deck, :view

	def initialize(file)
		@deck = Deck.new(file)
		@view = CardView.new
	end

	def run!
		view.welcome
		index = 0
		until index == deck.cards.length
			view.render(deck.cards[index])
			answer = user_input
			compare(answer, deck.cards[index])
			index += 1
		end
		view.the_end
	end

	def user_input
		gets.chomp
	end

	def compare(user_input, cards)
			if user_input == cards.answer
				view.correct
				return true
			else
				view.incorrect
				compare(gets.chomp, cards)
				return false
			end
	end


end

class CardView

	def render(cards)
		puts cards.question
	end

	def welcome
		puts "Welcome to Ruby Flashcards! Here's your first card:"
	end

	def correct
		puts "That's CORRECT!"
		puts
	end

	def incorrect
		puts "\nINCORRECT...\ntry again:"
	end

	def the_end
		puts "That's it! Thanks for playing."
	end
end

game = Flashcards.new("flashcard_samples.txt")
game.run!

  # def displayer(scenario)
  # 		case scenario
  # 		when welcome then "Welcome to Ruby Flashcards! Here's your first card:"
  # 		when correct
  # 		end
  # end





















