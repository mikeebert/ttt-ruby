module TTT
  class HumanPlayer 
    attr_accessor :symbol, :ui
  
    def initialize(symbol)
      @symbol = symbol
    end
    
    def human?
      true
    end
  end
end
