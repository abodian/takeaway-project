require_relative "../lib/customer_order"

describe "customer order class" do
  it "returns the order number" do
    io = double :io
    customer_order = CustomerOrder.new(io)
    expect(customer_order.order_number).to eq "001"
  end

  it "shows the menu" do
    io = double :io
    expect(io).to receive(:puts).with ("Please choose between chinese or indian takeaway: ")
    expect(io).to receive(:gets).and_return("chinese")
    expect(io).to receive(:puts).with ("Chinese Takeaway Menu")
    expect(io).to receive(:puts).with ("------------------------------------")
    expect(io).to receive(:puts).with(["01 - Egg Fried Rice - £2.50", "02 - Prawn Toast - £5.00"])
    customer_order = CustomerOrder.new(io)
    customer_order.show_menu
  end
end

describe "testing add_dishes method" do
  it "asks the user to choose a dish, then user types checkout, method accepts request with string output 01" do
    io = double :io
    expect(io).to receive(:puts).with ("Please choose between chinese or indian takeaway: ")
    expect(io).to receive(:gets).and_return("chinese")
    expect(io).to receive(:puts).with ("Chinese Takeaway Menu")
    expect(io).to receive(:puts).with ("------------------------------------")
    expect(io).to receive(:puts).with(["01 - Egg Fried Rice - £2.50", "02 - Prawn Toast - £5.00"])
    expect(io).to receive(:puts).with("Enter the number of the dish you would like to add to your order (or 'remove' to remove a dish, or 'checkout' to finish): ")
    expect(io).to receive(:gets).and_return("01")
    expect(io).to receive(:puts).with("How many of that dish would you like to add: ")
    expect(io).to receive(:gets).and_return("2")
    expect(io).to receive(:puts).with("2 x Egg Fried Rice added to your order")
    expect(io).to receive(:puts).with("Enter the number of the dish you would like to add to your order (or 'remove' to remove a dish, or 'checkout' to finish): ")
    expect(io).to receive(:gets).and_return("checkout")
    expect(io).to receive(:puts).with("Moving to order verification...")
    customer_order = CustomerOrder.new(io)
    output = customer_order.show_menu
    output = customer_order.build_order
  end
end

describe "testing remove_dishes method" do
  it "asks the user to choose a dish, then user types checkout, method accepts request with string output 02" do
    io = double :io
    expect(io).to receive(:puts).with ("Please choose between chinese or indian takeaway: ")
    expect(io).to receive(:gets).and_return("chinese")
    expect(io).to receive(:puts).with ("Chinese Takeaway Menu")
    expect(io).to receive(:puts).with ("------------------------------------")
    expect(io).to receive(:puts).with(["01 - Egg Fried Rice - £2.50", "02 - Prawn Toast - £5.00"])
    expect(io).to receive(:puts).with("Enter the number of the dish you would like to add to your order (or 'remove' to remove a dish, or 'checkout' to finish): ")
    expect(io).to receive(:gets).and_return("01")
    expect(io).to receive(:puts).with("How many of that dish would you like to add: ")
    expect(io).to receive(:gets).and_return("2")
    expect(io).to receive(:puts).with("2 x Egg Fried Rice added to your order")
    expect(io).to receive(:puts).with("Enter the number of the dish you would like to add to your order (or 'remove' to remove a dish, or 'checkout' to finish): ")
    expect(io).to receive(:gets).and_return("02")
    expect(io).to receive(:puts).with("How many of that dish would you like to add: ")
    expect(io).to receive(:gets).and_return("2")
    expect(io).to receive(:puts).with("2 x Prawn Toast added to your order")
    expect(io).to receive(:puts).with("Enter the number of the dish you would like to add to your order (or 'remove' to remove a dish, or 'checkout' to finish): ")
    expect(io).to receive(:gets).and_return("remove")
    expect(io).to receive(:puts).with("Enter the NAME of the dish you would like to remove from your order(or 'checkout' to finish): ")
    expect(io).to receive(:gets).and_return("egg fried rice")
    expect(io).to receive(:puts).with("Enter the number of dishes to remove: ")
    expect(io).to receive(:gets).and_return("1")
    expect(io).to receive(:puts).with("1 x EGG FRIED RICE removed from your order")
    expect(io).to receive(:puts).with("Enter the number of the dish you would like to add to your order (or 'remove' to remove a dish, or 'checkout' to finish): ")
    expect(io).to receive(:gets).and_return("checkout")
    expect(io).to receive(:puts).with("Moving to order verification...")
    customer_order = CustomerOrder.new(io)
    output = customer_order.show_menu
    output = customer_order.build_order
  end
end


