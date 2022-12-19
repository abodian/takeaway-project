class OrderVerify
  def initialize(order_number, order_array, io)
    @order_number = order_number
    @order_array = order_array
    @io = io
  end

  def receipt
    n = 1
    @order_list = []
    @order_array.each { | dish, price |
      price_format = format("%.2f", price)
      @order_list << "#{n}. #{dish} - £#{price_format}"
      n += 1
    }
    @io.puts @order_list
    grand_total
  end

  def grand_total
    total = []
    @order_array.each { | dish, price |
      total << price
      }
    total_sum = total.sum
    price_format = format("%.2f", total_sum)
    @io.puts "---------------------\nTotal Cost: £#{price_format}"
  end

  def verify
    @io.puts "Your order number #{@order_number} looks like this:"
    receipt
    @io.puts "Are you happy with your order? (Y - to proceed(automatic payment), or N - to edit order): "
    user_choice = @io.gets.chomp.downcase 
    user_choice == "y" ? true : false
  end
end

# verify = OrderVerify.new("001", [["Egg Fried Rice", 2.50], ["Prawn Toast", 5.00]], Kernel)
# verify.receipt