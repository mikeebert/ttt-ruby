require './board'

class Ai
  attr_accessor :test_board
  attr_accessor :possible_outcomes
  attr_accessor :current_player
  attr_accessor :move_counter
  attr_accessor :test_board
  
  def initialize
    @move_counter = 1
    @current_player = :computer
    @possible_outcomes = Hash.new
  end
  
  def move(board) # only exists for the initial purposes of testing
    random_move(board)  
    # self.create_test_board(board)
  end
  
  def random_move(board)
    position = board.available_spaces[rand(board.available_spaces.count - 1)]
    board.place_computer_move(position)  
  end

  def play_a_mock_game(board)
    create_test_board(board)
    board.available_spaces.each do |move|
      play_game_through(@test_board, move)
    end
  end
  
  def play_game_through(board, move)
    available_space = board.available_spaces[0]
    board.place_mock_move(available_space, @current_player)
    if board.has_winner || board.is_draw
      @possible_outcomes[move] = [final_value(board), @move_counter]
    else
      @move_counter += 1
      switch_current_player
      play_game_through(board, move)
    end    
  end

  def create_test_board(board)
    @test_board = Board.new(Math.sqrt(board.size).to_i)
    @test_board.computer_symbol = board.computer_symbol
    @test_board.human_symbol = board.human_symbol
    row_number = 0
    @test_board.grid.each do |row|
      row.replace(board.grid[row_number])
      row_number += 1
    end
    create_potential_outcome_hash
  end
  
  def create_potential_outcome_hash
    @test_board.available_spaces.each do |space|
      @possible_outcomes[space] = nil
    end    
  end
  
  def final_value(board)
    return 2 if board.winner == [board.computer_symbol]
    return 1 if board.is_draw
    return 0 if board.winner == [board.human_symbol]
  end

  def switch_current_player
    if @current_player == :computer
      @current_player = :human
    elsif @current_player == :human
      @current_player = :computer
    end
  end
  
  # def current_player_symbol
  #   @current_player == :computer ? @board.computer_symbol : @board.human_symbol
  # end
  
end
