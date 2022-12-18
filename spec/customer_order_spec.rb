require_relative "../lib/customer_order"

describe "customer order class" do
  it "returns the order number" do
    io = double :io
    customer_order = CustomerOrder.new("chinese", io)
    expect(customer_order.order_number).to eq "001"
  end

  it "shows the menu" do
    io = double :io
    expect(io).to receive(:puts).with(["01 - Egg Fried Rice", "02 - Prawn Toast"])
    customer_order = CustomerOrder.new("chinese", io)
    customer_order.show_menu
  end
end

describe "testing add_dishes method" do
  it "asks the user to choose a dish, then user types checkout, method accepts request with string output" do
    io = double :io
    expect(io).to receive(:puts).with("Enter the number of the dish you would like to choose(or 'checkout' to finish) a dish number to add it to your order: ")
    expect(io).to receive(:gets).and_return("01")
    expect(io).to receive(:puts).with("Egg Fried Rice added to your order")
    expect(io).to receive(:puts).with("Enter the number of the dish you would like to choose(or 'checkout' to finish) a dish number to add it to your order: ")
    expect(io).to receive(:gets).and_return("checkout")
    expect(io).to receive(:puts).with("Moving to order verification...")
    customer_order = CustomerOrder.new("chinese", io)
    output = customer_order.add_dishes
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