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
    @grid.flatten.include?(move) && space_available?(move)
  end
  
  def space_available?(move)
    coordinates_of(move)
    @grid[@row][@column] != human_symbol && @grid[@row][@column] != computer_symbol
  end  

  def available_spaces
    @grid.flatten.select {|value| value != computer_symbol && value != human_symbol}
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
      counter += 1 if space_available?(position) == false
    end
    return counter
  end

  def place_human_move(n)
    coordinates_of(n)
    @grid[@row][@column] = human_symbol
  end
  
  def place_computer_move(n)
    coordinates_of(n)
    @grid[@row][@column] = computer_symbol
  end
    
  def has_winner 
    @grid.each do |row|
      return true if row.uniq.count == 1 && row.uniq != nil
    end

    column_values = (0..(Math.sqrt(size) - 1)).to_a
    column_values.each do |x_position|
      column = @grid.map {|row| row[x_position]}
      return true if column.uniq.count == 1 && column.uniq != nil
    end        
    
    coordinates_of(1)
    forward_slash = []
    @grid.first.count.times do
      forward_slash << @grid[@row][@column]
      @row += 1
      @column += 1
    end
    return true if forward_slash.uniq.count == 1 && forward_slash.uniq != nil
    
    coordinates_of(Math.sqrt(size))
    backward_slash = []
    @grid.first.count.times do
      backward_slash << @grid[@row][@column]
      @row += 1
      @column -= 1
    end
    return true if backward_slash.uniq.count == 1 && backward_slash.uniq != nil
       
  end
  
  def is_draw
    move_count == @size && has_winner != true
  end
  

end