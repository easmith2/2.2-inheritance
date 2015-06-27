require './classes.rb'

# Let's make some dinos...
trex = Carnivore.new
trex.dino_name = "T. Rex"

velociraptor = Carnivore.new
velociraptor.dino_name = "Philosoraptor"

quetz = Carnivore.new
quetz.dino_name = "Quetzalcoatlus"
quetz.can_fly = true

oviraptor = Dino.new
oviraptor.dino_name = "Oviraptor"

brach = Herbivore.new
brach.dino_name = "Brachiosaurus"

iggy = Herbivore.new
iggy.dino_name = "Iguanodon"

ankyl = Armored.new
ankyl.dino_name = "Ankylosaurus"
ankyl.tail_armor_type = "club"

steg = Armored.new
steg.dino_name = "Stegosaurus"
steg.tail_armor_type = "spiked"

tricer = Horned.new
tricer.dino_name = "Triceratops"
tricer.has_frill = true
tricer.horn_count = 3

zuni = Horned.new
zuni.dino_name = "Zuniceratops"
zuni.has_frill = true
zuni.horn_count = 2


# Need to set up some menus...
def map_to_names(array_of_dinos)
  array_of_dinos.map.with_index{ |dino, i| "#{i+1}) #{dino.dino_name}"}
end

def menu_select(options_array)
  selection = ""
  until (1..options_array.length).include? selection
    print ">> "
    selection = gets.chomp.to_i
  end
  selection
end

category_list = [
  "1) All dinos",
  "2) All meat-eating dinos",
  "3) All plant-eating dinos",
  "4) All armored dinos",
  "5) All horned dinos"
  ]

all_dino = Dino.all
all_dino_names = map_to_names(all_dino)

all_carn = Carnivore.all
all_carn_names = map_to_names(all_carn)

all_herb = Herbivore.all
all_herb_names = map_to_names(all_herb)

all_armor = Armored.all
all_armor_names = map_to_names(all_armor)

all_horn = Horned.all
all_horn_names = map_to_names(all_horn)


# Guess we can actually do some things...
puts "Welcome to the not-so-realistic tour of a park with some extinct critters!\n\
First, you need to select a dino to follow.\nYou can choose a dino from the five groups below."
puts category_list
puts "Enter the number of the dino-group you'd like to choose from:"
first_selection = menu_select(category_list)

case first_selection
when 1
  puts "\nAll dinos:"
  puts all_dino_names
  puts "Enter the number of the dino you'd like to follow:"
  second_selection = menu_select(all_dino_names)
  dino_choice = all_dino[second_selection - 1]
when 2
  puts "\nAll meat-eaters:"
  puts all_carn_names
  puts "Enter the number of the dino you'd like to follow:"
  second_selection = menu_select(all_carn_names)
  dino_choice = all_carn[second_selection - 1]
when 3
  puts "\nAll plant-eaters:"
  puts all_herb_names
  puts "Enter the number of the dino you'd like to follow:"
  second_selection = menu_select(all_herb_names)
  dino_choice = all_herb[second_selection - 1]
when 4
  puts "\nAll armored dinos:"
  puts all_armor_names
  puts "Enter the number of the dino you'd like to follow:"
  second_selection = menu_select(all_armor_names)
  dino_choice = all_armor[second_selection - 1]
when 5
  puts "\nAll horned dinos:"
  puts all_horn_names
  puts "Enter the number of the dino you'd like to follow:"
  second_selection = menu_select(all_horn_names)
  dino_choice = all_horn[second_selection - 1]
end

puts "You chose #{dino_choice.dino_name}. Let's see what they're up to..."
sleep(2)
dino_choice.rawr
sleep(2)
dino_choice.walk
sleep(2)
dino_choice.run
sleep(2)
puts "\n#{dino_choice.dino_name} looks a little hungry. Let's see what they find...\n"
sleep(2)
if dino_choice.class == Carnivore || dino_choice.class == Dino
  dino_choice.stalk_prey("little dino-prey")
  sleep(3)
  dino_choice.attack("the defenseless little snack")
  sleep(2)
  dino_choice.consume("the wee dino")
  sleep(2)
  puts %{I wonder... is #{dino_choice.dino_name} into eating plants?
Let's see if they go for some veggies...}
  sleep(2)
  dino_choice.forage
elsif dino_choice.class == Herbivore || dino_choice.class.superclass == Herbivore
  dino_choice.forage
  sleep(3)
  dino_choice.consume("some leaves and shit")
  sleep(2)
  puts %{
A nice snack-sized dino has wondered into #{dino_choice.dino_name}\'s path.
Will #{dino_choice.dino_name} eat it?}
  sleep(2)
  dino_choice.stalk_prey("this little guy")
  dino_choice.attack
else
  puts "Looks like #{dino_choice.dino_name} can't find anything to eat. Saddinoface."
end

unless dino_choice == trex
  puts "\nUh oh, looks like T. Rex is approaching...\n"
  sleep(2)
  [Armored, Horned].include? dino_choice.class ? dino_choice.run_away : dino_choice.defend("T. Rex")
end

if [Armored, Horned].include? dino_choice.class
  puts %{
Did you know #{dino_choice.dino_name}, in addition to being a #{dino_choice.class.to_s.downcase} dino,
is also an #{dino_choice.class.superclass.to_s.downcase}?
The more you know...}
elsif dino_choice == quetz
  puts %{
Did you know #{dino_choice.dino_name} isn't even a dinosaur? It's just a giant,
flying reptile. It is one of the largest flying animals ever known to exist.
The more you know...}
end

puts "\n[fin]"
