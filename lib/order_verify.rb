class OrderVerify
  def initialize(order_number)
    @order_number = order_number
    @menu_list = []
  #   receipt
  #   grand_total
  #   verify
  end

  def receipt(order_array)
    n = 1
    order_array.each { | dish, price |
      p "#{n}. #{dish} - £#{price}"
      n += 1
    }
  end

  def grand_total
    # calculates and returns price of order
  end

  def verify
    # shows user receipt and grand_total
    # prompts user to confirm and verify order
    # returns true or false
  end
end

# verify = OrderVerify.new("001")
# verify.receipt([["Egg Fried Rice", 2.0], ["Prawn Toast", 5.0]])