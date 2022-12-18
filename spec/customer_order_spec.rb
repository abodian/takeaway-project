require_relative "../lib/customer_order"

describe "customer order class" do
  it "returns the order number" do
    customer_order = CustomerOrder.new("chinese")
    expect(customer_order.order_number).to eq "001"
  end

  it "shows the menu" do
    customer_order = CustomerOrder.new("chinese")
    expect do
      (customer_order.show_menu).to output("01 - Egg Fried Rice\n02 - Prawn Toast").to_stdout
    end
  end
end

# # 3 asks user to add dishes and returns the customer order
# chinese_order = CustomerOrder(001)
# chinese_order.show_menu(chinese)
# chinese_order.add_dishes # use doubles to simulate user input
# chinese_order.return_order => returns an array of customer_order

# # 4 returns to add dishes if user verifies order as false
# chinese_order = CustomerOrder(001)
# verify = OrderVerify.new # double
# chinese_order.show_menu(chinese)
# chinese_order.add_dishes
# verify.verify # false
# chinese_order.order_verify? => returns false