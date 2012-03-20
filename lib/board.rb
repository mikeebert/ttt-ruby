class Board
  
  attr_accessor :grid
  attr_accessor :size
  attr_accessor :human_symbol
  attr_accessor :computer_symbol
  
  def initialize(size)
    first_row = (1..size).to_a    
    row_start = 1
    row_end = size
    @grid = first_row.each do |n| 
              row = first_row.find_index(n)
              first_row[row] = (row_start..row_end).to_a
              row_start = row_end + 1
              row_end = row_end + size
            end
    @size = size * size
  end
  
  def valid_move(move)
    @grid.flatten.include?(move) && self.space_available?(move)
  end
  
  def space_available?(move)
    self.coordinates_of(move)
    @grid[@row][@column] != self.human_symbol && @grid[@row][@column] != self.computer_symbol
  end  

  def available_spaces
    @grid.flatten.select {|value| value != self.computer_symbol && value != self.human_symbol }
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
    return {row: @row, column: @column}
  end
  
  def move_count
    positions = self.size
    counter = 0
    (1..positions).each do |position|
      counter += 1 if self.space_available?(position) == false
    end
    return counter
  end

  def place_human_move(n)
    self.coordinates_of(n)
    @grid[@row][@column] = self.human_symbol
  end
  
  def place_computer_move(n)
    self.coordinates_of(n)
    @grid[@row][@column] = self.computer_symbol
  end
    
  def has_winner 
    @grid.each do |row|
      return true if row.uniq.count == 1
    end

    column_values = (0..(Math.sqrt(size).to_i - 1)).to_a
    column_values.each do |x_position|
      column = @grid.map {|row| row[x_position]}
      return true if column.uniq.count == 1
    end        
    
    #two horizontal methods are not independent of board size. REWRITE?
    return true if @grid[0][0] == @grid[1][1] && @grid[1][1] == @grid[2][2]
    return true if @grid[0][2] == @grid[1][1] && @grid[1][1] == @grid[2][0]
       
  end
  
  def is_draw
    self.move_count == @size && self.has_winner != true
  end
  

end