class OrderText
  def initialize(order_number)
    @order_number = order_number
  end

  def sms_confirmation
    # sends text to customer confirming order delivery time
    # Format: "Thank you! Your order was placed and will be delivered before 18:52"
    # Assume that order takes 1 hour
  end
end