require 'board'

class Ai
  attr_accessor :test_board
  attr_accessor :branches
  
  def initialize
    @branches = []
  end
  def move(board) # only exists for the initial purposes of testing
    random_move(board)  
    # self.create_test_board(board)
  end
  
  def random_move(board)
    position = board.available_spaces[rand(board.available_spaces.count - 1)]
    board.place_computer_move(position)  
  end
  
  # def create_test_board(board)
  #   @test_board = Board.new(Math.sqrt(board.size).to_i)
  #   @test_board.computer_symbol = board.computer_symbol
  #   @test_board.human_symbol = board.human_symbol
  #   row_number = 0
  #   @test_board.grid.each do |row|
  #     row.replace(board.grid[row_number])
  #     row_number += 1
  #   end
  # end
  # 
  # def minimax_that_shit(@test_board)
  #   @test_board.available_spaces.each do |move|
  #     branches << @test_board.test_computer_move(move)
  #     @test_board.place_computer_move(move)
  #     
  # end
  
end
