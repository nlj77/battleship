require './lib/ship'

RSpec.describe Ship do

  it 'exists' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser).to be_instance_of(Ship)
  end

  it 'displays ship name' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.name).to eq("Cruiser")
  end

  it 'displays ship length' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.length).to eq(3)
  end

  it 'displays ship health' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.health).to eq(3)
  end

  it 'is sunk?' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.sunk?).to eq(false)
  end

  it 'loses health when hit' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit

    expect(cruiser.health).to eq(2)
  end

  it 'sunk after hit once?' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit

    expect(cruiser.sunk?).to eq(false)
  end

  it 'loses health when hit twice' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    cruiser.hit

    expect(cruiser.health).to eq(1)
  end

  it 'sunk after hit twice?' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    cruiser.hit

    expect(cruiser.sunk?).to eq(false)
  end

  it 'sunk after hit 3 times?' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    cruiser.hit
    cruiser.hit

    expect(cruiser.sunk?).to eq(true)
  end
end
