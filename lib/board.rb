require './lib/cell'
require './lib/ship'


class Board

  #Sets up an attr reader with heighth and width of our cells,
attr_reader :height, :width, :cells, :ships
#Initializes a new board object with height attributes, width attributes, and
#cells. Will need to define our create_cells method later.
  def initialize(height = 4, width = 4)
    @height = height
    @width = width
    @cells = create_cells
  end


  def create_cells
  #Creates a new hash to hold our coordinates we're making "A1" etc.
    @hash_coordinates = Hash.new
  #Creates two ranges. One, our width_range takes how long our grid is (default
  #is 4) Then uses a range to run from 1 to whereever we set (Again default is 4)
    @width_range = 1..@width
  #Creates a height range. For this project our rows, or height indices are our
  #letters. Height range takes "A" as our first element of our range
  #then runs that range to the .ord method of our defacto first row, "A" plus
  #however tall our height is (default 4)
    @height_range = "A"..(("A".ord)+ @height-1).chr

    #Creates a loop that for each number in our width range, take each letter in
    #our height range, and create a coordinate that is the letter plus the num.
    #shovel that into our hash_coordinates and make each element a object of cell.
    @width_range.each do |numbers|
      @height_range.each do |letters|

        coordinate = letters + numbers.to_s
        @hash_coordinates[coordinate] = Cell.new(coordinate)
      end
    end
    #returns the created hash for use in our initialize method.
    return @hash_coordinates
  end

  # hash_coordinates.keys? = xaxis
  # hash_coordinates.values? = yaxis
  def valid_coordinate?(coordinate)
    @hash_coordinates.key?(coordinate)
  end

  def valid_placement?

  end
end
