class Item
  attr_accessor :name
  attr_accessor :price
  attr_accessor :tier
  attr_accessor :suit
  attr_accessor :modifier
  attr_accessor :distance

MODIFIERS = ["body","spirit","mind","max_hp","ac","healrate","min_damage","max_damage","initiative","melee","ranged","trading","speech","lockpick","traps"]

  def get_item_name(complexity)
    prefix = ["Проклятый","Святой","Кожаный","Железный","Серебрянный","Ядовитый","Пламенный","Морозный","Искрящийся","Героический","Великий","Могучий","Кошмарный"]
    root = ["Доспех","Меч","Топор","Кинжал","Лук","Арбалет","Шлем","Амулет","Пояс","Молот","Том","Щит"]
    suffix = ["Завоевателя","Дракона","Архимага","Разбойника","Алхимика","Убийцф","Мученника","Короля","Ярости","Разрушения","Зла","Инквизитора","Алчности","Иллюзии","Лича","Страдания","Викинга","Смерти","Императора"]
    case complexity
      when 1..2
        item_name = "#{root[rand(root.size)]} +#{rand(2)+1} "
      when 3..4
        item_name = "#{prefix[rand(prefix.size)]} #{root[rand(root.size)]}"
      when 5
        item_name = "#{root[rand(root.size)]} #{suffix[rand(suffix.size)]} "
      when 6
        item_name = "#{prefix[rand(prefix.size)]} #{root[rand(root.size)]} #{suffix[rand(suffix.size)]} "
    end
    #{prefix[rand(prefix.size)]}
    return item_name
  end



  def set_modifiers(tier,modifiers)
    for i in 0..3*tier-1
     index = rand(15)
     modifiers[MODIFIERS[index]] = modifiers[MODIFIERS[index]] + 1
    end
    return modifiers
  end

  def get_info
    puts
    puts "#{@name} (#{@tier})"
    puts

    @modifiers.each {|key, value|
      if value != 0
        puts "#{key}: +#{value}"
      end}

  end

  def initialize(complexity)
    @name = get_item_name(complexity)
    @price = 0
    @tier = complexity
    @modifiers = Hash.new()
    @modifiers["body"]=0
    @modifiers["spirit"]=0
    @modifiers["mind"]=0

    @modifiers["max_hp"]=0
    @modifiers["ac"]=0
    @modifiers["healrate"]=0

    @modifiers["min_damage"]=0
    @modifiers["max_damage"]=0
    @modifiers["initiative"]=0

    @modifiers["melee"]=0
    @modifiers["ranged"]=0
    @modifiers["trading"]=0
    @modifiers["speech"]=0
    @modifiers["traps"]=0
    @modifiers["lockpick"]=0

    @modifiers = set_modifiers(@tier,@modifiers)

    price = 0
    for i in 0..complexity
      price = price + 20 + rand(10)
    end
    @price =  price
  end
end