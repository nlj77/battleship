require './lib/ship'
require './lib/cell'

RSpec.describe Cell do

  it 'exists' do
    cell = Cell.new("B4")

    expect(cell).to be_instance_of(Cell)
  end

  xit 'has an assigned coordinate' do
    cell = Cell.new("B4")

    expect(cell.coordinate).to eq("B4")
  end

  xit 'checks if ship is in cell' do
    cell = Cell.new("B4")

    expect(cell.ship).to eq(nil)
  end

  xit 'checks if cell is empty' do
    cell = Cell.new("B4")

    expect(cell.empty?).to eq(true)
  end

  xit 'has an assigned coordinate' do
    cell = Cell.new("B4")

    expect(cell.coordinate).to eq("B4")
  end

  xit 'can place_ship' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    expect(cell.ship).to be_instance_of(Ship)
  end

end
