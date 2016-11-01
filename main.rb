
require_relative 'skills.rb'
require_relative 'battlefield.rb'
require_relative 'generate_map.rb'

h = Person.new(3)
h.get_info
i = Item.new(rand(6)+1)
i.get_info
b = Battlefield.new(rand(20),rand(10),rand(4)+1)
b.print_battlefield
gm = GlobalMap.new(h)
#gm.print_world

# gets.chomp()
# gm.print_world
#gm.open_random_area(1)
3.times do
  gm.open_random_square(rand(100)+1,rand(50)+1,h)
  gets.chomp()
  gm.print_world(h)
end
