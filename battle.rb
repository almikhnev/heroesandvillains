require 'colorize'

class Person1
  def body
    @body
  end

  def spirit
    @spirit
  end

  def mind
    @mind
  end

  def hp
    @hp
  end

  def max_hp
    @max_hp
  end

  def morale
    @morale
  end

  def change_moral(moral)
    @morale = moral
  end

  def change_hp(hp)
    @hp = @hp+hp
  end


  def initialize(body,spirit,mind)
    @body = body
    @spirit = spirit
    @mind = mind
    @hp = @body/2.to_i+1
    @max_hp = @hp
  end



  def get_info()
    return "Body: #{@body}, Spirit: #{@spirit}, Mind: #{@mind}  (hp: #{@hp}, Morale: #{@morale}) "
  end
end

h_body = rand(10)+1
h_mind = rand(10)+1
h_spirit = rand(10)+1

sum = h_body+h_mind+h_spirit

while sum!=15
  h_body = rand(10)+1
  h_mind = rand(10)+1
  h_spirit = rand(10)+1
  sum = h_body+h_mind+h_spirit
end
hero = Person.new(h_body,h_spirit,h_mind)
opponent = Person.new(rand(7)+1,rand(7)+1,rand(7)+1)
puts "Hero - [#{hero.get_info}]"
puts "Opponent - [#{opponent.get_info}]"

puts "Battle begins!!!"

# morale before battle
h_moral = hero.spirit + rand(3) + 1
o_moral = opponent.spirit + rand(3) + 1
check_moral_diff = h_moral - o_moral

puts "[#{h_moral} vs #{o_moral}]"

case check_moral_diff
  when -99..-5
    hero.change_moral(0)
    opponent.change_moral(2)
    puts "Вы обосрались от страха! Противники наносит две атаки за раунд, вы пропускаете каждый второй раунд".red
  when -4..-2
    hero.change_moral(0)
    opponent.change_moral(1)
    puts "Старшновато! Противники наносит две атаки за раунд".red
  when -1..1
    hero.change_moral(1)
    opponent.change_moral(1)
    puts "равные характеры".yellow
  when 2..4
    hero.change_moral(1)
    opponent.change_moral(0)
    puts "Вы атакуете два раза за раунд".green
  when 5..99
    hero.change_moral(2)
    opponent.change_moral(0)
    puts "Вы атакуете два раза за раунд, противник пропускает каждый второй раунд".green
end




n_round = 0
while hero.hp>0 && opponent.hp>0

  n_round = n_round + 1
  puts "-------Round #{n_round} ---------- "
  puts


  if hero.morale == 0 && opponent.morale == 2
    #оппонент наносит два удара
    2.times do
      hit_check = opponent.body + rand(6)+1
      if hit_check > hero.body + rand(6)
        hero.change_hp(-1)
        puts "Enemy wounded you by 1 hp".red
      else
        puts "Enemy is missed".yellow
      end
    end
    # герой наносит удар в два раунда
    if n_round%2 == 0
      hit_check = hero.body + rand(6)+1
      if hit_check > opponent.body + rand(6)
        opponent.change_hp(-1)
        puts "You wound enemy for 1 hp".green
      else
        puts "You are missed".yellow
      end
    end
  end

  if hero.morale == 0 && opponent.morale == 1
    #оппонент наносит два удара
    2.times do
      hit_check = opponent.body + rand(6)+1
      if hit_check > hero.body + rand(6)
        hero.change_hp(-1)
        puts "Enemy wounded you by 1 hp".red
      else
        puts "Enemy is missed".yellow
      end
    end
    # герой наносит удар в два раунда

      hit_check = hero.body + rand(6)+1
      if hit_check > opponent.body + rand(6)
        opponent.change_hp(-1)
        puts "You wound enemy for 1 hp".green
      else
        puts "You are missed".yellow
      end

  end

  if hero.morale == 1 && opponent.morale == 1
    #оппонент наносит один удар

      hit_check = opponent.body + rand(6)+1
      if hit_check > hero.body + rand(6)
        hero.change_hp(-1)
        puts "Enemy wounded you by 1 hp".red
      else
        puts "Enemy is missed".yellow
      end

    # герой наносит удар

    hit_check = hero.body + rand(6)+1
    if hit_check > opponent.body + rand(6)
      opponent.change_hp(-1)
      puts "You wound enemy for 1 hp".green
    else
      puts "You are missed".yellow
    end

  end


  if hero.morale == 1 && opponent.morale == 0
  #оппонент наносит один удар

  hit_check = opponent.body + rand(6)+1
  if hit_check > hero.body + rand(6)
    hero.change_hp(-1)
    puts "Enemy wounded you by 1 hp".red
  else
    puts "Enemy is missed".yellow
  end

  # герой наносит удар
  2.times do
    hit_check = hero.body + rand(6)+1
    if hit_check > opponent.body + rand(6)
      opponent.change_hp(-1)
      puts "You wound enemy for 1 hp".green
    else
      puts "You are missed".yellow
    end
  end
end

  if hero.morale == 2 && opponent.morale == 0
    #оппонент наносит один удар
    if n_round%2 == 0
    hit_check = opponent.body + rand(6)+1
    if hit_check > hero.body + rand(6)
      hero.change_hp(-1)
      puts "Enemy wounded you by 1 hp".red
    else
      puts "Enemy is missed".yellow
    end
    end
    # герой наносит удар
    2.times do
      hit_check = hero.body + rand(6)+1
      if hit_check > opponent.body + rand(6)
        opponent.change_hp(-1)
        puts "You wound enemy for 1 hp".green
      else
        puts "You are missed".yellow
      end
    end
  end






  puts "You: (#{hero.hp}/#{hero.max_hp})hp , Enemy: (#{opponent.hp}/#{opponent.max_hp})hp "


  if hero.hp <= 0
    puts "hero is dead..".red
  end

  if opponent.hp <= 0
    puts "you kill your enemy..".green
  end


  gets.chomp()
end



