<<<<<<< HEAD
# THE MODEL

# a Deck class should load in the .txt. file
# once it's got the file, it needs to parse it and make new Card objects
# card object have @question and @answer variables
# the Deck class has just a @deck variable

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

<<<<<<< HEAD
	def initialize(question, answer)
		@question = question
		@answer   = answer
=======
	def initialize()
		# @question =
		# @answer   =
>>>>>>> 4ebe146283a9caea0c01eb0f0b7514cacc494041
	end

end

deck = Deck.new("flashcard_samples.txt")
<<<<<<< HEAD
puts deck.cards
=======
p deck.cards
=======

# CONTROLLER - John

class Flashcards
# run! method (ref to render, user_input, compare)



end

# VIEW - Pablo

class CardView

# displays card
# def to_s

end
>>>>>>> Devin_John_Pablo
>>>>>>> 4ebe146283a9caea0c01eb0f0b7514cacc494041
