require 'commandlineinterface'
require 'board'
require 'ai'

class Player
  
  attr_accessor :ui
  attr_accessor :ai
  attr_accessor :type
  attr_accessor :symbol
  
  def initialize
    @ui = CommandLineInterface.new
  end

  def set_type_of_player(n)
    input = @ui.ask_for_type_of_player(n)
    if input == :human 
      @type = :human
    else 
      @type = :computer
      @ai = Ai.new
    end
  end
  
  def move(board)
    move = get_move(board)
    board.place_move(@symbol, move)
    @ui.computer_move_message if @type == :computer
  end
  
  def get_move(board)
    if @type == :human 
      move = get_human_move(board)
    else
      move = get_computer_move(board)
    end
    return move
  end
  
  def get_human_move(board)
    @ui.prompt_for_next_move
    input = @ui.get_input
    if board.valid_move(input)
      return input 
    else      
      @ui.invalid_move_message
      get_human_move(board)
    end
  end
  
  def get_computer_move(board)
    space = @ai.move(board)
    return space
  end
  
end
