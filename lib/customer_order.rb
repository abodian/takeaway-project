require_relative "./menu.rb"
require_relative "./order_verify.rb"
require_relative "./order_text.rb"

class CustomerOrder
  attr_reader :order_number
  attr_reader :customer_order
  
  def initialize(io)
    @cuisine = nil
    @order_number = "001"
    @customer_order = []
    @instance_of_menu = Menu.new(@cuisine)
    @instance_of_verify = OrderVerify.new(@order_number, @customer_order, Kernel)
    @customer_menu = @instance_of_menu.list_menu
    @menu_hash = @instance_of_menu.return_menu_hash
    @io = io
  end

  def run 
    show_menu
    build_order
    order_verify?
  end

  def show_menu
    @io.puts "Please choose between chinese or indian takeaway: "
    @cuisine = @io.gets.chomp
    @instance_of_menu = Menu.new(@cuisine)
    @io.puts "#{@cuisine.capitalize} Takeaway Menu"
    @io.puts "------------------------------------"
    @customer_menu = @instance_of_menu.list_menu
    @menu_hash = @instance_of_menu.return_menu_hash
    @io.puts @customer_menu
  end

  def build_order
    @order_complete = false
    while !@order_complete
      @io.puts "Enter the number of the dish you would like to add to your order (or 'remove' to remove a dish, or 'checkout' to finish): "
      @dish_number = @io.gets.chomp
      @dish_number == "remove" ? remove_dishes : add_dishes
    end
    @io.puts "Moving to order verification..."
  end

  def add_dishes
    return @order_complete = true if @dish_number == "checkout"
  
    @io.puts "How many of that dish would you like to add: "
    @dish_amount = @io.gets.to_i
    chosen_dish_details = @menu_hash[@dish_number]
    return @io.puts "Sorry, that dish does not exist. Please try again." unless chosen_dish_details
  
    chosen_dish = chosen_dish_details[0]
    @dish_amount.times { @customer_order << chosen_dish_details }
    @io.puts "#{@dish_amount} x #{chosen_dish} added to your order"
  end

  def remove_dishes
    @io.puts "Enter the NAME of the dish you would like to remove from your order(or 'checkout' to finish): "
    dish_name = @io.gets.chomp
    @order_complete = true if dish_name == "checkout"
  
    chosen_dish_details = @menu_hash.values.find { |dish| dish[0].downcase == dish_name.downcase }
    @io.puts "Sorry, that dish does not exist. Please try again." unless chosen_dish_details
  
    @io.puts "Enter the number of dishes to remove: "
    num_dishes = @io.gets.chomp.to_i
    num_dishes.times do
      index = @customer_order.index { |dish| dish[0].downcase == dish_name.downcase }
      @io.puts "Sorry, there are no more dishes of that type in your order." unless index
  
      @customer_order.delete_at(index)
    end
    @io.puts "#{num_dishes.to_s} x #{dish_name.upcase} removed from your order"
  end

  def order_verify?
    verified = false
    while verified == false
      return build_order unless @instance_of_verify.verify == true

      verified = true
      @io.puts "Thank you for your payment, you will soon receive a confirmation text :)"
      # next two lines would send a text if credentials are added to the order_text class
      # text = OrderText.new("001", "requester")
      # text.sms_confirmation
    end
  end
end

order = CustomerOrder.new(Kernel)
order.run
