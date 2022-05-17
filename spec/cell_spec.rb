require './lib/ship'
require './lib/cell'

RSpec.describe Cell do

  it 'exists' do
    cell = Cell.new("B4")

    expect(cell).to be_instance_of(Cell)
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

    expect(cell.empty?).to eq(false)
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

  it 'exists' do
    cell_1 = Cell.new("B4")

    expect(cell_1).to be_instance_of(Cell)
  end

  it 'renders coordinate' do
    cell_1 = Cell.new("B4")

    expect(cell_1.render).eq(".")
  end

  it 'fire_upon affects render' do
    cell_1 = Cell.new("B4")
    cell_1.fire_upon

    expect(cell_1).to eq("M")
  end

  it 'exists' do
    cell_1 = Cell.new("B4")
    cell_1.fire_upon
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    expect(cell_2).to be_instance_of(Cell)
    expect(cruiser).to be_instance_of(Ship)
  end

  it 'place_ship does not affect render' do
    cell_1 = Cell.new("B4")
    cell_1.fire_upon
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)

    expect(cell_2.render).to eq(".")
  end

  it 'render(true) reveals place_ship' do
    cell_1 = Cell.new("B4")
    cell_1.fire_upon
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)

    expect(cell_2.render(true)).to eq("S")
  end

  it 'render shows hit with fire_upon' do
    cell_1 = Cell.new("B4")
    cell_1.fire_upon
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    cell_2.fire_upon

    expect(cell_2.render).to eq("H")
  end

  it 'sunk?' do
    cell_1 = Cell.new("B4")
    cell_1.fire_upon
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    cell_2.fire_upon

    expect(cruiser.sunk?).to eq(false)
  end

  it 'sunk? if hit' do
    cell_1 = Cell.new("B4")
    cell_1.fire_upon
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    cell_2.fire_upon
    cruiser.hit
    cruiser.hit

    expect(cruiser.sunk?).to eq(true)
  end

  it 'render if sunk?' do
    cell_1 = Cell.new("B4")
    cell_1.fire_upon
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    cell_2.fire_upon
    cruiser.hit
    cruiser.hit

    expect(cell_2.render).to eq("X")
  end


end
