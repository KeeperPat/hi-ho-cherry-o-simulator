require_relative 'spinner.rb'

class Player
  attr_reader :cherries_in_tree
  
  def initialize
    @cherries_in_tree = 10
  end

  def cherries_in_basket
    10 - cherries_in_tree
  end

  def play_turn
    case Spinner.spin
      when :one
        @cherries_in_tree -= 1
      when :two
        @cherries_in_tree -= 2
      when :three
        @cherries_in_tree -= 3
      when :four
        @cherries_in_tree -= 4
      when :dog, :bird
        if cherries_in_basket == 1
          @cherries_in_tree +=1
        elsif cherries_in_basket >= 2
          @cherries_in_tree +=2
        end
      when :spilled_basket
        @cherries_in_tree = 10
    end

    if @cherries_in_tree < 0
      @cherries_in_tree = 0
    end
  end

  def winner?
    cherries_in_tree == 0
  end
end