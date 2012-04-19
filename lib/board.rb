class Board
  
  attr_accessor :grid
  attr_accessor :size
  attr_accessor :winner
  attr_accessor :next_player, :player1_symbol, :player2_symbol
  
  def initialize(size)
    @grid = fresh_grid(size)
    @size = size * size
    @next_player = :player1
  end
  
  def fresh_grid(size)
    first_row = (1..size).to_a    
    row_start = 1
    row_end = size
    first_row.each do |n| 
      row = first_row.find_index(n)
      first_row[row] = (row_start..row_end).to_a
      row_start = row_end + 1
      row_end = row_end + size
    end
  end
  
  def place_move(symbol, space)
    coordinates_of(space)
    @grid[@row][@column] = symbol
    switch_next_player
  end
  
  # def next_player_symbol
  #   @next_player == :player1 ? @player1_symbol : @player2_symbol
  # end
  
  def opponent_symbol
    @next_player == :player1 ? @player2_symbol : @player1_symbol
  end
  
  def switch_next_player
    @next_player == :player1 ? @next_player = :player2 : @next_player = :player1
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
  
  def valid_move(move)
    available_spaces.include?(move)
  end
  
  def available_spaces
    @grid.flatten.select {|value| value.class == Fixnum}
  end
  
  def move_count
    @size - available_spaces.count
  end
  
  def is_draw
    move_count == @size && has_winner != true
  end
      
  def has_winner
    return true if horizontal_winner == true
    return true if vertical_winner == true
    return true if forward_slash_winner == true
    return true if backward_slash_winner == true 
  end  
  
  def horizontal_winner
    @grid.each do |row|
      if row.uniq.count == 1 && row.uniq != nil
        @winner = row.uniq
        return true
      end
    end
  end
  
  def vertical_winner
    column_values = (0..(Math.sqrt(size) - 1)).to_a
    column_values.each do |x_position|
      column = @grid.map {|row| row[x_position]}
      if column.uniq.count == 1 && column.uniq != nil
        @winner = column.uniq
        return true
      end
    end
  end
  
  def forward_slash_winner
    coordinates_of(1)
    forward_slash = []
    @grid.first.count.times do
      forward_slash << @grid[@row][@column]
      @row += 1
      @column += 1
    end
    if forward_slash.uniq.count == 1 && forward_slash.uniq != nil
      @winner = forward_slash.uniq
      return true
    end
  end
  
  def backward_slash_winner
    coordinates_of(Math.sqrt(size))
    backward_slash = []
    @grid.first.count.times do
      backward_slash << @grid[@row][@column]
      @row += 1
      @column -= 1
    end
    if backward_slash.uniq.count == 1 && backward_slash.uniq != nil
      @winner = backward_slash.uniq
      return true
    end
  end

  def reset_grid
    @grid = fresh_grid(@grid.count)
  end
  
end