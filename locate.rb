class Location

  def n_events
    @n_events
  end

  def name
    @name
  end

  def get_location_name
    prefix = ["Проклятая","Святая","Древняя","Легендарная","Мрачная","Заброшенная","Неизведанная","Неприступная","Призрачная","Героическая","Великая","Могучая","Кошмарная"]
    root = ["Тюрьма","Башня","Темница","Крипта","Лаборатория","Шахта","Крепость","Церковь","Конюшня","Арена","Пирамида","Гробрница","Сокровищница","Цитадель","Расщелина","Стена"]
    suffix = ["Завоевателей","Дракона","Архимага","Разбойников","Алхимиков","Убийц","Мученников","Короля","Предков","Грехов","Зла","Минотавра","Алчности","Иллюзий","Лича","Страданий","Викингов","Смерти","Императора"]
    location = "#{prefix[rand(prefix.size)]} #{root[rand(root.size)]} #{suffix[rand(suffix.size)]} "
    return location
  end

  def initialize(n_events)
    @n_events = n_events
    @name = get_location_name
  end
end