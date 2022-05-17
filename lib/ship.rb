class Ship

#Create an attributre reader for the name, length, and health of a Ship

def initialize(name, length)
  @name = name
  @length = length
  @health = length
end

def sunk?
  health == 0
end

def hit
  health -= 1
end 

end
