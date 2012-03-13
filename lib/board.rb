class Board
  
  attr_accessor :grid
  
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
    location = self.coordinates_of(move)
    y = location[0]
    x = location[1]
    @grid[y][x] != "x" && @grid[y][x] != "o"
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
    return @row, @column
  end
  
  def move_count
    positions = @grid.flatten.count
    counter = 0
    (1..positions).each do |position|
      counter += 1 if self.space_available?(position) == false
    end
    return counter
  end

end