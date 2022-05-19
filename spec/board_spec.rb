require './lib/board'
require './lib/cell'
require './lib/ship'

RSpec.describe Board do

  it 'exists' do
    board = Board.new

    expect(board).to be_instance_of(Board)
  end

  it "has coordinates in hash?" do
    board = Board.new

    expect(board.cells).to be_instance_of(Hash)
    expect(board.cells.length).to eq(16)
  end

  it "is valid_coordinate?" do
    board = Board.new

    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("D4")).to eq(true)
    expect(board.valid_coordinate?("A5")).to eq(false)
    expect(board.valid_coordinate?("E1")).to eq(false)
    expect(board.valid_coordinate?("A22")).to eq(false)
  end

end
