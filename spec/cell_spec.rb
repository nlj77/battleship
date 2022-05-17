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
