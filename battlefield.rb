require 'colorize'
class Battlefield
  attr_accessor :x, :y
  attr_accessor :battlefield
  attr_accessor :obstaclerate
  attr_accessor :enemies
  attr_accessor :traps

  def print_battlefield
    puts "Map #{@x}x#{@y}"
    puts "% of obstacles: #{@obstaclerate}"
    puts "№ of traps: #{@traps}"
    for i in 0..@x-1
      puts
      for j in 0..@y-1
        if @battlefield[i][j] == "."
        print "#{@battlefield[i][j]}".green
        end
        if @battlefield[i][j] == "*"
          print "#{@battlefield[i][j]}".red
        end
        if @battlefield[i][j] == "^"
          print "#{@battlefield[i][j]}".yellow
        end
        if @battlefield[i][j] != "^" && @battlefield[i][j] != "*" && @battlefield[i][j] != "."
          print "#{@battlefield[i][j]}".blue
        end
      end
    end
  end

  def initialize(obstaclerate,n_traps,n_enemies)
    @obstaclerate = obstaclerate
    @x = 12+rand(4)
    @y = 12+rand(4)
    @battlefield = Array.new
    for i in 0..@x-1
      @battlefield[i]=[]
      for j in 0..@y-1
        @battlefield[i][j]="."
      end
    end

    for i in 0..@x-1
      for j in 0..@y-1
        is_obstacle = rand(100)+1
        if is_obstacle < @obstaclerate
          @battlefield[i][j] = "^"
        end
      end
    end

   @traps = n_traps
    n_traps.times do
      i_trap = rand(@x)
      j_trap = rand(@y)
      @battlefield[i_trap][j_trap] = "*"
    end

   @enemies = n_enemies
   for k in 1..n_enemies
     i_enemy = rand(@x)
     j_enemy = rand(@y)
     @battlefield[i_enemy][j_enemy] = "#{k}"
   end
  end

end