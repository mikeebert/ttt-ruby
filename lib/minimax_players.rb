module TTT
  class MinPlayer
    attr_accessor :symbol, :starting_score
    def initialize(symbol, score)
      @symbol = symbol
      @starting_score = score
    end
    
    def compare(best_score,new_score)
      new_score < best_score ? new_score : best_score
    end
  end

  class MaxPlayer
    attr_accessor :symbol, :starting_score
    def initialize(symbol, score)
      @symbol = symbol
      @starting_score = score
    end
    
    def compare(best_score, new_score)
      new_score > best_score ? new_score : best_score
    end
  end
end