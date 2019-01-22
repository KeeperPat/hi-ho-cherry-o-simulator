require_relative 'game.rb'

class Simulation
  attr_reader :stats, :intermediate_results

  def initialize(number_of_players = 4, number_of_games = 1000)
    @number_of_players = number_of_players
    @number_of_games = number_of_games
    @stats = {
    }
    @total_game_length = 0
  end

  def run
    @intermediate_results = {:scale => []}
    results = {}
    @number_of_players.times do |player| 
      results[player+1] = 0
      @intermediate_results[player+1] = []
    end

    @number_of_games.times do |i|
      game = Game.new(@number_of_players)
      winner = game.play

      update_stats(game)

      if (i+1 >= 10) && ((i+1) % (10 ** Math.log10(i+1).floor) == 0)
        @intermediate_results[:scale] << i+1
        @number_of_players.times do |player|
          @intermediate_results[player+1] << results[player+1].to_f / (i+1)
        end
        
      end

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