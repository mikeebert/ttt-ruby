module TTT
  class MinimaxPlayer
    attr_accessor :symbol, :starting_score
    def initialize(symbol, score)
      @symbol = symbol
      @starting_score = score
    end
  end

  class MinPlayer < MinimaxPlayer
    def compare(best_score,new_score)
      new_score < best_score ? new_score : best_score
    end
  end

  class MaxPlayer < MinimaxPlayer
    def compare(best_score, new_score)
      new_score > best_score ? new_score : best_score
    end
  end
end