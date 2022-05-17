class Ship

#Create an attribute reader for the name, length, and health of a Ship
attr_reader :name, :length, :health

def initialize(name, length)
  @name = name
  @length = length
  @health = length
end

def sunk?
  health == 0
end

def hit
  #changed 'health' to '@health' to get method to pass
  @health -= 1
end

end
