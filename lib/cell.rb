class Cell

  #Create an attribute reader for coordinate, ship, and fired upon.
  attr_reader :coordinate, :ship, :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ()
    @fired_upon = false

  end

  def empty?
    @ship.nil?

    # if @ship == nil
    #   true
    # else false
    # end
  end
#Creates and returns a ship
  def place_ship(ship)
    @ship = ship

  end

  #Creates a fire upon method that also establishes fired_upon. If there is a S
  #ship in the cell, then call hit method from ship.

  def fire_upon
    return "This cell has already been fired upon" if fired_upon
    @fired_upon = true
    if @ship != nil
      @ship.hit
    end
  end

  def render(ship_reveal = false)

    # @ship = ship

    if fired_upon == true && empty? || fired_upon == true && empty? && ship_reveal == true
      return "M"
    elsif fired_upon == true && empty? == false && ship.sunk? == false
      return "H"
    elsif fired_upon == true && empty? == false && ship.sunk?
      return "X"
    elsif ship_reveal == true && empty? == false
      return "S"
    else
      return "."
  end
end

end
