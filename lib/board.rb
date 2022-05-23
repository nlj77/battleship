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
    # 3. does coordinate have a ship in it already?
    # 4. is ship consecutive either COMPLETELY horizontal
    #    or COMPLETELY vertical (diagonal test).

    return false if ship.length != ship_coords.length
    return false if ship_coords.any?{|coordinate| !valid_coordinate?(coordinate)}
    return false if ship_coords.any?{|coordinate| @cells[coordinate].empty? == false}

    diagonal_check(ship, ship_coords)

  end

  def place(ship, ship_coords)
    ship_coords.each do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
  end

  def render(ship_reveal = false)
    if ship_reveal == false
      return "  1 2 3 4 \n"+ "A #{@cells['A1'].render} #{@cells['A2'].render} #{@cells['A3'].render} #{@cells['A4'].render} \n"+
      "B #{@cells['B1'].render} #{@cells['B2'].render} #{@cells['B3'].render} #{@cells['B4'].render} \n" +
      "C #{@cells['C1'].render} #{@cells['C2'].render} #{@cells['C3'].render} #{@cells['C4'].render} \n" +
      "D #{@cells['D1'].render} #{@cells['D2'].render} #{@cells['D3'].render} #{@cells['D4'].render} \n"
    elsif ship_reveal == true
      return  "  1 2 3 4 \n"+ "A #{@cells['A1'].render(true)} #{@cells['A2'].render(true)} #{@cells['A3'].render(true)} #{@cells['A4'].render(true)} \n"+
      "B #{@cells['B1'].render(true)} #{@cells['B2'].render(true)} #{@cells['B3'].render(true)} #{@cells['B4'].render(true)} \n" +
      "C #{@cells['C1'].render(true)} #{@cells['C2'].render(true)} #{@cells['C3'].render(true)} #{@cells['C4'].render(true)} \n" +
      "D #{@cells['D1'].render(true)} #{@cells['D2'].render(true)} #{@cells['D3'].render(true)} #{@cells['D4'].render(true)} \n"
    end
  end

end
