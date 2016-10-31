
require_relative 'skills.rb'
require_relative 'battlefield.rb'

h = Person.new(3)
h.get_info
i = Item.new(rand(6)+1)
i.get_info
b = Battlefield.new(rand(20),rand(10),rand(4)+1)
b.print_battlefield