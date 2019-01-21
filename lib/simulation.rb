require_relative 'game.rb'

class Simulation
  attr_reader :stats

  def initialize(number_of_players = 4, number_of_games = 1000)
    @number_of_players = number_of_players
    @number_of_games = number_of_games
    @stats = {
    }
    @total_game_length = 0
  end

  def run
    results = {}
    @number_of_players.times{|player| results[player+1] = 0}

    @number_of_games.times do
      game = Game.new(@number_of_players)
      winner = game.play

      update_stats(game)

      results[winner] += 1
    end

    stats[:average_game_length] = @total_game_length.to_f / @number_of_games

    results
  end

  private
    def update_stats(game)
      if stats[:minimum_game_length].nil? || game.winning_number_of_moves < stats[:minimum_game_length]
        stats[:minimum_game_length] = game.winning_number_of_moves
      end

      if stats[:maximum_game_length].nil? || game.winning_number_of_moves > stats[:maximum_game_length]
        stats[:maximum_game_length] = game.winning_number_of_moves
      end
      @total_game_length += game.winning_number_of_moves
    end
end