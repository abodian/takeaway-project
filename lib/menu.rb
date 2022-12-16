class Menu
  def initialize(cuisine)
    @cuisine = cuisine
    $chinese_menu = {"01" => ["Egg Fried Rice", 2.00]}
    $menu_list = []
  end

  def list_array
    @cuisine == "chinese" ? @chinese_menu : nil
    $chinese_menu.each { | number, dish |
      return $menu_list << "#{number} - #{dish.at(0)}"
    }
    return $menu_list
  end

  def dish_name(number)
    return $chinese_menu[number].at(0)
  end

  def dish_price(number)
    return $chinese_menu[number].at(1)
  end
end
