require_relative "./menu.rb"

class CustomerOrder
  def initialize(cuisine)
    @cuisine = cuisine
    @order_number = "001"
    @customer_order = []
    @instance_of_menu = Menu.new(@cuisine)
    @customer_menu = []
  end

  def order_number
    @order_number
  end

  def show_menu
    @customer_menu << @instance_of_menu.list_menu
    puts @customer_menu.flatten
  end

  def add_dishes 
    # will prompt user to select dish numbers to build customer order, pushes dishes to $customer_order
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

order = CustomerOrder.new("chinese")
order.show_menu