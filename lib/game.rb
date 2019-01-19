require_relative 'player.rb'

class Game
  attr_reader :players

  def initialize(number_of_players = 4)
    @players = []
    number_of_players.times{@players << Player.new}
  end

  def play
    @players.cycle do |player|
      player.play_turn
      
      break if player.winner?
    end

    return winner
  end

  private
    def winner
      players.find_index{|a| a.winner?} + 1
    end
end