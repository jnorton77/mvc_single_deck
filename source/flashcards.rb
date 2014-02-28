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
		text_lines = text.split("\n")
		text_lines.delete("")
		text_lines
	end

end

class Card

	def initialize()
		# @question = 
		# @answer   = 
	end

end

deck = Deck.new("flashcard_samples.txt")
p deck.cards