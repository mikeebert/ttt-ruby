class MockPlayerFactory
  attr_accessor :player1_type, :player1_symbol,
                :player2_type, :player2_symbol,
                :ui
  
  def create(input_hash, ui)
    if @player1_type.nil?
      @player1_type = input_hash[:type]
      @player1_symbol = input_hash[:symbol]
      @ui = ui
    else
      @player2_type = input_hash[:type]
      @player2_symbol = input_hash[:symbol]
      @ui = ui
    end
    return MockPlayer.new(input_hash[:symbol])
  end
  
end

class MockPlayer
  attr_accessor :symbol
  
  def initialize(symbol)
    @symbol = symbol
  end
end