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
  
end