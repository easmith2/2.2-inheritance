class Dino
  attr_accessor :dino_name, :diet, :hunting_style, :prey, :plants_eaten, :can_fly

  def initialize
    self.diet = "Omnivore"
    self.can_fly = false
  end

  def consume(food)
    puts "#{dino_name} nommed on #{food}."
  end

  def walk
    puts "#{dino_name} is walking. How thrilling."
  end

  def run
    puts "#{dino_name} just ran. Only moderately exciting."
  end

  def rawr
    puts "RAAAWWWWWRRRR! (Translation: #{dino_name} says \"Hi!\")"
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

  def stalk_prey(prey)
    puts "#{dino_name} has gone into stealth mode.\nBeware #{prey}, #{dino_name} is watching you...."
  end

  def attack(prey)
    puts "#{dino_name} senses the time is right and pounces on #{prey}. RAWWWRRR"
  end

  def forage
    puts "#{dino_name} is in the mood for a salad. Off to find some toppings!"
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end
end

class Carnivore < Dino

  def initialize
    self.diet = "Carnivore"
  end

  def forage
    puts "#{dino_name} eats meat, not this green junk."
  end

  def run
    self.can_fly ? puts("#{dino_name} just flew. That's kinda cool.") : super
  end

  def run_away
    self.can_fly ? puts("#{dino_name} just flew away. Wuss.") : super
  end

end

class Herbivore < Dino

  def initialize
    self.diet = "Herbivore"
  end

  def stalk_prey(prey)
    puts "#{dino_name} eats plants, not dinos like #{prey}."
  end

  def attack
    puts "#{dino_name} doesn't want to attack. Just wants to eat moar plants."
  end
end

class Armored < Herbivore
  # Calling this "Armored" seemed easier than "Thyreophora"
  attr_accessor :body_armor_type, :tail_armor_type, :head_armor_type

end

class Horned < Herbivore
  # Calling this "Horned" seemed easier than "Ceratopsia"
  attr_accessor :has_frill, :horn_count
  #
  # def stalk_prey(prey)
  #   super
  # end

end
