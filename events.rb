require_relative 'skills.rb'
require 'colorize'
require_relative 'item.rb'

class Event
  def complexity
    @complexity
  end

  def type
    @type
  end


  def check_event(hero)

  if @type == "battle"
    enemies = []
    case @complexity
      when 1..3
        n_enemy = 1
      when 4
        n_enemy = 2
      when 5
        n_enemy = 3
      when 6
        n_enemy = 4
    end
    for i in 0..n_enemy-1
      enemies << Person.new(@complexity)
    end
    puts "Your enemies in this event are:".red
    for j in 0..enemies.size-1
      puts "#{@complexity} lvl - B: #{enemies[j].b}| S: #{enemies[j].s}| M: #{enemies[j].m} ".blue
    end
  end

  if @type == "speaking"
    enemies = []
    case @complexity
      when 1..3
        n_enemy = 1
      when 4
        n_enemy = 2
      when 5
        n_enemy = 3
      when 6
        n_enemy = 4
    end
    for i in 0..0
      enemies << Person.new(@complexity)
    end
    puts "Man who you need to persuade is :".red
    for j in 0..enemies.size-1
      puts "#{@complexity} lvl - B: #{enemies[j].b}| S: #{enemies[j].s}| M: #{enemies[j].m} ".blue
    end
  end

  if @type == "shopping"
    items = []
    case @complexity
      when 1..3
        n_item = 1
      when 4
        n_item = 2
      when 5
        n_item = 3
      when 6
        n_item = 4
    end
    shopkeeper = Person.new(@complexity)
    for i in 0..n_item-1
      items << Item.new(@complexity)
    end
    puts "You can buy such items in this event:".red
    for j in 0..items.size-1
      puts " #{j+1} #{items[j].name} for #{items[j].price} coins".blue
    end
  end

  end

  def initialize(complexity)
    @complexity = complexity
    type_n = rand(3)
    case type_n
      when 0
        @type = "battle"
      when 1
        @type = "shopping"
      when 2
        @type = "speaking"

    end

  end
end