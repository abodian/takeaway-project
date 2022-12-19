require_relative "./menu.rb"
require_relative "./order_verify.rb"

class CustomerOrder
  attr_reader :order_number
  attr_reader :customer_order
  
  def initialize(cuisine, io)
    @cuisine = cuisine
    @order_number = "001"
    @customer_order = []
    @instance_of_menu = Menu.new(@cuisine)
    @customer_menu = @instance_of_menu.list_menu
    @menu_hash = @instance_of_menu.return_menu_hash
    @io = io
  end

  def show_menu
    @io.puts @customer_menu
  end

  def build_order
    @order_complete = false
    while !@order_complete
      @io.puts "Enter the number of the dish you would like to add to your order (or 'remove' to remove a dish, or 'checkout' to finish): "
      @dish_number = @io.gets.chomp
      if @dish_number == "remove"
        remove_dishes
      else
        add_dishes
      end
    end
    @io.puts "Moving to order verification..."
  end

  def add_dishes
    if @dish_number == "checkout"
      @order_complete = true
    else
      chosen_dish_details = @menu_hash[@dish_number]
      if chosen_dish_details
        chosen_dish = chosen_dish_details[0]
        @customer_order << chosen_dish_details
        @io.puts "#{chosen_dish} added to your order"
      else
        @io.puts "Sorry, that dish does not exist. Please try again"
      end
    end
  end

  def remove_dishes
    @io.puts "Enter the number of the dish you would like to remove from your order(or 'checkout' to finish): "
    @dish_number = @io.gets.chomp
    if @dish_number == "checkout"
      @order_complete = true
    else
      chosen_dish_details = @menu_hash[@dish_number]
      if chosen_dish_details
        chosen_dish = chosen_dish_details[0]
        @customer_order.delete(chosen_dish_details)
        @io.puts "#{chosen_dish} removed from your order"
      else
        @io.puts "Sorry, that dish does not exist. Please try again"
      end
    end
  end

  def order_verify?
    verified = false
    verify = OrderVerify.new("001")
    while verified == false
      @io.puts "Your order looks like this:"
      verify.receipt(@customer_order)
      @io.puts "Move to payment? (Y - to proceed, or N - to edit order): "
      user_choice = @io.gets.chomp.downcase 
      if user_choice == "y"
        verify = true
        verify.grand_total
      else 
        build_order
      end
    end
  end
end

# order = CustomerOrder.new("chinese", Kernel)
# order.show_menu
# order.build_order
# order.order_verify?
