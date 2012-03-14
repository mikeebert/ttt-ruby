class Board
  
  attr_accessor :grid
  attr_accessor :human_symbol
  attr_accessor :computer_symbol
  
  def initialize(size)
    @grid = new_array = (1..size).to_a
            start_of_row = 1
            end_of_row = size
            new_array.each do |n| 
              row = new_array.find_index(n)
              new_array[row] = (start_of_row..end_of_row).to_a
              start_of_row = end_of_row + 1
              end_of_row = end_of_row + size
            end
  end
  
  def valid_move(move)
    @grid.flatten.include?(move) && self.space_available?(move) == true
  end
  
  def space_available?(move)
    self.coordinates_of(move)
    @grid[@column][@row] != "x" && @grid[@column][@row] != "o"
  end  
  
  def coordinates_of(move)
    blank_grid = Board.new(@grid.count).grid
    row_count = 0
    blank_grid.each do |row|
      if row.include?(move)        
        @row = row_count
        @column = row.find_index(move)
      end
      row_count += 1
    end
    return {:row => @row, :column => @column}
  end
  
  def move_count
    positions = @grid.flatten.count
    counter = 0
    (1..positions).each do |position|
      counter += 1 if self.space_available?(position) == false
    end
    return counter
  end

  def place_human_move(n)
    self.coordinates_of(n)
    @grid[@column][@row] = "x"
  end
  
  def place_move(player, n)
    self.coordinates_of(n)
    @grid[@column][@row] = player
  end
  
  def has_winner 
    @grid.each do |row|
      return true if row.uniq.count == 1
    end

    column_values = @grid[0].count - 1
    (0..column_values).to_a.each do |x_position|
      column = @grid.map {|row| row[x_position]}
      return true if column.uniq.count == 1
    end    
  end
  # 
  # @grid.each do |row| 
  #   return true if row.uniq == ["x"] || row.uniq == ["o"]
  # end
  # 
  # horizontal_positions = (0..(@grid[0].count - 1)).to_a
  # horizontal_positions.each do |x|
  #  return true if @grid[0][x] == @grid[1][x] && @grid[0][x] == @grid[2][x]
  # end    
  # 
  # #two horizontal methods are not independent of board size. REWRITE?
  # return true if @grid[0][0] == @grid[1][1] && @grid[1][1] == @grid[2][2]
  # return true if @grid[0][2] == @grid[1][1] && @grid[1][1] == @grid[2][0]
  # 

end