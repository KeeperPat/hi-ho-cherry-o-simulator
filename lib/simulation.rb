require_relative 'game.rb'

class Simulation
  def initialize(number_of_players = 4, number_of_games = 1000)
    @number_of_players = number_of_players
    @number_of_games = number_of_games
  end

  def run
    results = {}
    @number_of_players.times{|player| results[player+1] = 0}

    @number_of_games.times do
      winner = Game.new(@number_of_players).play
      
      results[winner] += 1
    end

    results
  end
end