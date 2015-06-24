class Dino
  attr_accessor :dino_name, :walks_on, :size, :gender, :has_offspring

  def consume(edible)
    puts "#{dino_name} just nommed on #{edible}."
  end

  def walk
    puts "#{dino_name} just walked. How thrilling."
  end

  def run
    puts "#{dino_name} just ran. Only moderately exciting."
  end

  def rawr
    puts "RAAAWWWWWRRRR! a.k.a. #{dino_name} says \"Hi!\""
  end

  def sleep
    puts "zzzzzzzzzzzzzzzzzz"
  end

  def run_away
    puts "#{dino_name} just ran away. Wuss."
  end

  def defend(attacker)
    puts "#{dino_name} stood their ground against #{attacker}. How cute."
  end

end

class Omnivore < Dino
  attr_accessor :hunting_style, :prey, :plants_eaten

  def stalk_prey
  end

  def attack
  end

  def forage
  end

end

class Carnivore < Omnivore
  #attr_accessor
end


class Herbivore < Omnivore
  #attr_accessor 
end


class Armored < Herbivore
  # Calling this "Armored" seemed easier than "Thyreophora"
  attr_accessor :body_armor_type, :tail_armor_type, :head_armor_type

end

class Horned < Herbivore
  # Calling this "Horned" seemed easier than "Ceratopsia"
  attr_accessor :has_frill, :horn_count

end


'''
class TRex < Carnivore
  #attr_accessor

end

class Velociraptor < Carnivore
  #attr_accessor

end

class Quetzalcoatlus < Carnivore
  #attr_accessor

end

class Oviraptor < Omnivore
  #attr_accessor

end

class Brachiosaurus < Herbivore
  #attr_accessor

end

class Ankylosaurus < Armored
  #attr_accessor

end

class Stegosaurus < Armored
  #attr_accessor

end

class Triceratops < Horned
  #attr_accessor

end

class Zuniceratops < Horned
  #attr_accessor

end

class Iguanodon
  #attr_accessor

end
'''
