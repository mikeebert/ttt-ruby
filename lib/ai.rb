require './board'

class Ai
  attr_accessor :test_board
  attr_accessor :possible_outcomes
  attr_accessor :current_player
  attr_accessor :test_board
  
  def initialize
    @possible_outcomes = Hash.new
  end
  
  def move(board) # only exists for the initial purposes of testing
    random_move(board)  
    # play_all_games(board)
    # puts @possible_outcomes

    # self.create_test_board(board)
  end
  
  def random_move(board)
    position = board.available_spaces[rand(board.available_spaces.count - 1)]
    board.place_computer_move(position)  
  end
  
  def play_all_games(board)
    board.available_spaces.each do |move| 
      @move = move
      @possible_outcomes[@move] = []
      @test_board = create_test_board(board)
      @test_board.next_player = :computer
      @test_board.place_mock_move(move)
      play_all_possible_games(@test_board)
    end  
  end
  
  def play_all_possible_games(board)
    if board.has_winner || board.is_draw
      @possible_outcomes[@move] << final_value(board)
    else
      board.available_spaces.each do |next_move|
        new_board = create_test_board(board)
        new_board.place_mock_move(next_move)
        play_all_possible_games(new_board)
      end
    end    
  end

  def create_test_board(board)
    test_board = Board.new(Math.sqrt(board.size).to_i)
    test_board.computer_symbol = board.computer_symbol
    test_board.human_symbol = board.human_symbol
    test_board.next_player = board.next_player
    row_number = 0
    test_board.grid.each do |row|
      row.replace(board.grid[row_number])
      row_number += 1
    end
    test_board
  end
  
  def final_value(board)
    if board.winner == [board.computer_symbol]
      return 100/board.move_count
    elsif board.is_draw
      return 0
    end
  end
  
end
