class OrderVerify
  def initialize(order_number)
    @order_number = order_number
  end

  def receipt
    # formats and returns itemised receipt of order
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