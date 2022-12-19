class Menu
  def initialize(cuisine)
    @cuisine = cuisine
    @chinese_menu = {"01" => ["Egg Fried Rice", "2.00"], "02" => ["Prawn Toast", "5.00"]}
    @indian_menu = {}
    @menu_list = []
  end

  def return_menu_hash
    return @chinese_menu
  end

  def list_menu
    @cuisine == "chinese" ? @chinese_menu : @indian_menu
    @chinese_menu.each { | number, dish |
      @menu_list << "#{number} - #{dish.at(0)} - £#{dish.at(1)}"
    }
    return @menu_list
  end

  def dish_name(number)
    return @chinese_menu[number].at(0)
  end

  def dish_price(number)
    return @chinese_menu[number].at(1).to_i
  end
end

# menu = Menu.new("chinese")
# menu.list_menu