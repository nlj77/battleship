require './lib/ship'
require './lib/cell'

RSpec.describe Cell do

  it 'exists' do
    cell = Cell.new("B4")

    expect(cell).to be_instance_of(Ship)
  end

  it 'has an assigned coordinate' do
    cell = Cell.new("B4")

    expect(cell.coordinate).to eq("B4")
  end

  it 'checks if ship is in cell' do
    cell = Cell.new("B4")

    expect(cell.ship).to eq(nil)
  end

  it 'checks if cell is empty' do
    cell = Cell.new("B4")

    expect(cell.empty?).to eq(true)
  end

  it 'has an assigned coordinate' do
    cell = Cell.new("B4")

    expect(cell.coordinate).to eq("B4")
  end

  it 'can place_ship' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    expect(cell.ship).to be_instance_of(Ship)
  end

  it 'shows place_ship fills the coordinate' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    expect(cell.empty?).to eq(true)
  end
#Second part of cell interaction pattern is bellow

  it 'can place_ship' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    expect(cell.fired_upon).to eq(false)
  end

  it 'checks if ship was fired_upon' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    expect(cell.fired_upon).to eq(false)
  end

  # Fire upon should substract 1 health
  it 'fire_upon ship' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon

    expect(cell.ship.health).to eq(2)
  end

  it 'fire_upon modifies fired_upon?' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon
    cell.ship.health

    expect(cell.fired_upon).to eq(true)
  end

  it 'fire_upon modifies fired_upon?' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon
    cell.ship.health

    expect(cell.fired_upon).to eq(true)
  end

#Third part of cell interaction pattern is bellow

end
