require './board'

class Ai
  attr_accessor :test_board
  attr_accessor :possible_outcomes
  attr_accessor :current_player
  attr_accessor :test_board
  attr_accessor :original_move_count
  
  def initialize
    @possible_outcomes = Hash.new
  end
  
  def move(board) # only exists for the initial purposes of testing
    # random_move(board)    
    play_all_games(board)
    board.place_computer_move(best_move)

    # self.create_test_board(board)
  end
  
  def random_move(board)
    position = board.available_spaces[rand(board.available_spaces.count - 1)]
    board.place_computer_move(position)  
  end
  
  def play_all_games(board)
    @possible_outcomes = Hash.new
    @original_move_count = board.move_count
    board.available_spaces.each do |move| 
      @move = move
      @possible_outcomes[@move] = {:max => 0, :min => 0, :draw => 0}
      @test_board = create_test_board(board)
      @test_board.next_player = :computer
      @test_board.place_mock_move(move)
      play_all_possible_games(@test_board)
    end  
  end
  
  def play_all_possible_games(board)
    if board.has_winner || board.is_draw
      rank_minimax(final_value(board))
    else
      # if final_value(board) > @possible_outcomes[@move].max || final_value(board) < @possible_outcomes[@move].min
      board.available_spaces.each do |next_move|
        new_board = create_test_board(board)
        new_board.place_mock_move(next_move)
        play_all_possible_games(new_board)
      end
      # end
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
    moves = board.move_count - @original_move_count
    if board.winner == [board.computer_symbol]
      return 100/moves
    elsif board.is_draw
      return 1
    else
      return -(100/moves)
    end
  end
  
  def rank_minimax(value)
    if value > 1   
      @possible_outcomes[@move][:max] += value
    elsif value < 0
      @possible_outcomes[@move][:min] += value
    else
      @possible_outcomes[@move][:draw] = 1
    end
  end
  
  def best_move
    # if @possible_outcomes.collect {|move, value| value[:min] == 0}
    #   @possible_outcomes.select {|move, value| value[:min] == 0}.first[0]
    # else
      @possible_outcomes.max_by {|move,data| data[:max]}.first
    # end
  end

end
