require './board'

class GameState

  def of(board)
    branches = []
    board.available_spaces.each do |move|
      branches << test_computer_move(move)
      place_computer_move(move) if test_computer_move[:test_board] == 2
      break
    end
  
    branches.if there are any 0 moves than make it and break
  
    branches(&:test_board).each do |branch|
      GameState.of(branch)
    end
  end
      
def test_computer_move(move)
  test_board
  return {:rank => (0,1 or 2), :test_board => "board with move placed" }
end


#Each time its the computers move then hit the algorithm

Heuristics
@move_count
@available_spaces

rank_moves
available_spaces.each do |move|
  computer_move(move) if GameState.of(move) game.has_winner && @winner == [@computer_symbol]
  
  if @game

@three_moves