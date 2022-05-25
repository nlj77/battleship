require './lib/cell'
require './lib/ship'
require './lib/board'

class Game
  attr_reader

  def initialize
    @player_board = nil
    @computer_board = nil
  end

  def game_start
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."

    player_answer = gets.chomp.downcase

    while player_answer != "p" && player_answer != "q"
      puts "Invalid response. Press p to play or q quit."
      player_answer = gets.chomp.downcase
    end

    if player_answer == "p"
      setup_game
    elsif player_answer == "q"
      puts "Quit? You quit???? Argh, okay..."
      exit!
    end

  end

  def setup_game
    @player_board = Board.new
    @computer_board = Board.new

    puts "Pick a number: 1 or 2 (This determines the computer ship placement)"
    @x = gets.chomp.to_i
    until @x == 1 || @x == 2
      puts "Pick either 1 or 2"
      @x = gets.chomp.to_i
    end

    puts "Place your two ships."
    puts "The mighty Cruiser is 3 units long and the Submarine is 2 units long."

    @player_board.render
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)

    puts "Enter the coordinates for your Cruiser (3 units). Put a space between each coordinate."
    player_cruiser_coordinates = gets.chomp.upcase.split(" ")

    until @player_board.valid_placement?(@player_cruiser, player_cruiser_coordinates) == true
      puts "Enter valid coordinates for your Cruiser (3 units)."
      player_cruiser_coordinates = gets.chomp.upcase.split(" ")

    end
    @player_board.place(@player_cruiser, player_cruiser_coordinates)
    puts "==========PLAYER BOARD=========="
    puts @player_board.render(true)

    puts "Enter the coordinates for your Submarine (2 units). Put a space between each coordinate."
    player_submarine_coordinates = gets.chomp.upcase.split(" ")

    until @player_board.valid_placement?(@player_submarine, player_submarine_coordinates) == true
      puts "Enter valid coordinates for your Submarine (2 units)."
      player_submarine_coordinates = gets.chomp.upcase.split(" ")
    end
    @player_board.place(@player_submarine, player_submarine_coordinates)
    puts "==========PLAYER BOARD=========="
    puts @player_board.render(true)


    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)

    puts "Computer: I have placed my ships on the grid. Prepare for battle."

    if @x == 1
      @computer_board.place(@computer_cruiser, ["D1", "D2", "D3"])
      @computer_board.place(@computer_submarine, ["B4", "C4"])
    elsif @x == 2
      @computer_board.place(@computer_cruiser, ["B1", "C1", "D1"])
      @computer_board.place(@computer_submarine, ["C4", "D4"])
    end


    puts "==========COMPUTER BOARD=========="
    puts @computer_board.render

    player_turn

  end

  def player_turn
    puts "It is your turn, choose a coordinate to fire at."
    player_shot = gets.chomp.upcase.to_s
    until @computer_board.valid_coordinate?(player_shot) == true && @computer_board.cells[player_shot].fired_upon == false
      puts "Enter a valid coordinate."
      player_shot = gets.chomp.upcase.to_s
    end

    @computer_board.cells[player_shot].fire_upon
    if @computer_board.cells[player_shot].render == "M"
      puts "===That was a MISSSSSS.===\n"
    elsif @computer_board.cells[player_shot].render == "H"
      puts "===That was a HIT! STEAL THEIR RUM!===\n"
    elsif @computer_board.cells[player_shot].render == "X"
      puts "===You sunk a ship! Make 'em walk the plank!===\n"
    end

    puts "==========COMPUTER BOARD==========\n"
    puts @computer_board.render
    puts "==========PLAYER BOARD==========\n"
    puts @player_board.render(true)

    if @player_submarine.sunk? && @player_cruiser.sunk?
      puts "The COMPUTER won this round! Sorry Matey!"
      Game.new.game_start
    elsif @computer_submarine.sunk? && @computer_cruiser.sunk?
      puts "You WON! Drink their rum and frollick in their gold!"
      Game.new.game_start
    else
      computer_turn
    end
  end


  def computer_turn
    computer_shot = @player_board.cells.keys.sample
    @player_board.cells[computer_shot].fire_upon

    if @player_board.cells[computer_shot].render == "M"
      puts "===The computer missed.===\n"

    elsif @player_board.cells[computer_shot].render == "H"
      puts "===The computer hit your ship!===\n"
    elsif @player_board.cells[computer_shot].render == "X"
      puts "===The computer sunk one of your ships!===\n"
    end

    puts "==========COMPUTER BOARD==========\n"
    puts @computer_board.render
    puts "==========PLAYER BOARD==========\n"
    puts @player_board.render(true)
    if @player_submarine.sunk? && @player_cruiser.sunk?
      puts "The COMPUTER won this round! Sorry Matey!"
      Game.new.game_start
    elsif @computer_submarine.sunk? && @computer_cruiser.sunk?
      puts "You WON! Drink their rum and frollick in their gold!"
      Game.new.game_start
    else
      player_turn
    end
  end

end

Game.new.game_start
