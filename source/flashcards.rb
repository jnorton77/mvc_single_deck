module DeckLoader
  def self.parse(file)
    text = File.open(file, "rb").read
    text = text.split("\n")
    text.delete("")
    cards = []
    text.each_slice(2) do |slice|
      cards << Card.new(slice[0], slice[1])
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
    @deck = DeckLoader.parse(file)
    @view = CardView.new
  end

  def run!
    view.welcome
    deck.each do |card|
      view.render(card)
      answer = user_input
      compare(answer, card)
    end
    view.the_end
  end

  def user_input
    gets.chomp
  end

  def compare(input, cards)
    if input == cards.answer
      view.correct
      true
    elsif input == "quit"
      exit
    else
      view.incorrect
      compare(user_input, cards)
      false
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





















