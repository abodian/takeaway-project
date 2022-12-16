class CustomerOrder
  def initialize(order_number)
    $order_number = order_number
    $customer_order = []
  end

  def order_number
    # returns order number
  end

  def show_menu(menu)
    # gets chinese menu from an instance of Menu class and formats list, storing in instance variable, returns to user
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