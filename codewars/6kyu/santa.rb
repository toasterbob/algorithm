GIFTS = {
    1 => 'Toy Soldier',
    2 => 'Wooden Train',
    4 => 'Hoop',
    8 => 'Chess Board',
   16 => 'Horse',
   32 => 'Teddy',
   64 => 'Lego',
  128 => 'Football',
  256 => 'Doll',
  512 => "Rubik's Cube"
}

def gifts(number)
  toys = []
  GIFTS.keys.reverse.each do |price|
    if number > price
      toys << GIFTS[price]
      number -= price
    end
  end
  toys.sort
end
