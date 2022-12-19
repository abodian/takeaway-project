class Menu
  def initialize(cuisine)
    @cuisine = cuisine
    @chinese_menu = {"01" => ["Egg Fried Rice", 2.50], "02" => ["Prawn Toast", 5.00]}
    @indian_menu = {"01" => ["Onion Bhaji", 3.50], "02" => ["Chicken Korma", 7.00]}
    @menu_list = []
  end

  def return_menu_hash
    return @chinese_menu
  end

  def list_menu
    @cuisine == "chinese" ? menu = @chinese_menu : menu = @indian_menu
    menu.each { | number, dish |
      price = format("%.2f", dish.at(1))
      @menu_list << "#{number} - #{dish.at(0)} - £#{price}"
    }
    return @menu_list
  end

  def dish_name(number)
    return @chinese_menu[number].at(0)
  end

  def dish_price(number)
    return @chinese_menu[number].at(1)
  end
end

