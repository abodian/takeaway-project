require_relative "./menu.rb"

class CustomerOrder
  def initialize(cuisine, io)
    @cuisine = cuisine
    @order_number = "001"
    @customer_order = []
    @instance_of_menu = Menu.new(@cuisine)
    @customer_menu = @instance_of_menu.list_menu
    @menu_hash = @instance_of_menu.return_menu_hash
    @io = io
  end

  def order_number
    @order_number
  end

  def show_menu
    @io.puts @customer_menu
  end

  def add_dishes
    order_complete = false
    while !order_complete
      prompt_dish = "Enter the number of the dish you would like to choose(or 'checkout' to finish) a dish number to add it to your order: "
      @io.puts prompt_dish
      dish_number = @io.gets.chomp
      if dish_number == "checkout"
        order_complete = true
      else
        begin
          chosen_dish_details = @menu_hash[dish_number]
          chosen_dish = chosen_dish_details[0]
          @customer_order << chosen_dish
          @io.puts "#{chosen_dish} added to your order"
        rescue
          @io.puts "Sorry, that dish does not exist. Please try again"
        end
      end
    end
    @io.puts "Moving to order verification..."
  end

  def remove_dishes
    # will remove a dish from an order
  end



  def order_verify?
    # checks if customer has verified order, using instance of OrderVerify
    # calls OrderText if true
    # returns to add_dishes
  end
end

# order = CustomerOrder.new("chinese", Kernel)
# order.show_menu
# order.add_dishes