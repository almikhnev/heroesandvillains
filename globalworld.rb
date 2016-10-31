require 'colorize'
require_relative 'skills'
require_relative 'locate'
require_relative 'events'
N_NODES = 14
N_LEVELS = 4




locations = []
for c in 0..N_NODES-1
  locations << Location.new(1)
end


world_matrix = []
for i in 0..N_NODES-1
  world_matrix[i] = []
   for j in 0..N_NODES-1
     world_matrix[i][j] = 0
   end
end


def show_matrix(matrix,locations)
  for i in 0..N_NODES-1
    puts
    if i < 10
      print "#{locations[i].name} | ".blue
    else
      print "#{locations[i].name} | ".blue
    end

    for j in 0..N_NODES-1
    print "#{matrix[i][j]}, "
    end
  end
end


def proceed_by_matrix(person,matrix,locations)
  i = 0
  puts
  path = []
  person.get_info
  while i!=N_NODES-1
   available_nodes = []
    puts "From current place you can go in such ways: "
    for j in 0..N_NODES-1
      if matrix[i][j] == 1
        available_nodes << j
      end
    end
    for k in 0..available_nodes.size-1
      puts "#{k+1}:  #{locations[available_nodes[k]].name}."
    end
    chosen = gets.chomp().to_i
    # puts "#{chosen}".yellow
    # puts "#{available_nodes[chosen-1]}".green
    i = available_nodes[chosen-1]

    puts "You are on #{locations[i].name}."
    puts "====================================="
    path << locations[i].name
    for n_e in 0..4
      case i
        when 0
          complexity = 1
        when 1..3
          complexity = 2
        when 4..6
          complexity = 3
        when 7..9
          complexity = 4
        when 10..12
          complexity = 5
        when 13
          complexity = 6

      end
      e = Event.new(complexity)
      e.check_event(person)
      gets.chomp()
    end

  end
  puts "Your journey path was - #{path}".green
end



nodes_for_game = N_NODES - 2
nodes_for_level = nodes_for_game/N_LEVELS

for i in 1..nodes_for_level # переход из обучения в фазу основного приключения
  world_matrix[0][i] = 1
end

for i in N_NODES-nodes_for_level..N_NODES-1 # переход из фазы игры в фазу финальной битвы/приключения
  world_matrix[i-1][N_NODES-1] = 1
end

for i in 1..N_LEVELS-1
  for j in 1..nodes_for_level
    world_matrix[i+3*(j-1)][i+3*j]=1
  end
end

20.times do
  i = rand(8)+2
  j = i + rand(3)+1
  world_matrix[i][j] = 1
end


hero = Person.new(3)
proceed_by_matrix(hero,world_matrix,locations)
show_matrix(world_matrix,locations)


