require_relative 'player.rb'

class Game
  attr_reader :players, :winning_number_of_moves

  def initialize(number_of_players = 4)
    @players = []
    number_of_players.times{@players << Player.new}
  end

  def play
    moves = 0

    @players.cycle do |player|
      player.play_turn

      moves +=1

      break if player.winner?
    end

    @winning_number_of_moves = (moves.to_f / @players.length).ceil

    return winner
  end

  private
    def winner
      players.find_index{|a| a.winner?} + 1
    end
end