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

  def diagonal_check(ship, ship_coords)
    rows = []
    columns = []
    ship_coords.each do |coordinate|
      rows << coordinate.split("")[0].ord
      columns << coordinate.split("")[1].to_i
    end
    if rows.each_cons(2).all? {|a,b| b == a} && columns.each_cons(2).all? {|a,b| b == a + 1}
      return true
    elsif rows.each_cons(2).all? {|a,b| b == a + 1} && columns.each_cons(2).all? {|a,b| b == a}
      return true
    else
      return false
  end
  end

  def valid_placement?(ship, ship_coords)
    # 1. ship length match # of coordinates?
    # 2. coordinates are in playing board?
    # 3/4. is ship either COMPLETELY horizontal or COMPLETELY vertical (diagonal test)
    # 5. does coordinate have a ship in it already?
    return false if ship.length != ship_coords.length
    return false if ship_coords.any?{|coordinate| !valid_coordinate?(coordinate)}
    return false if ship_coords.any?{|coordinate| @cells[coordinate].empty? == false}

    diagonal_check(ship, ship_coords)

  end
end
