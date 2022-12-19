require "customer_order"
require "menu"
require "order_text"
require "order_verify"

describe "takeaway integration" do
  it "returns the customers chosen menu" do
    io = double :io
    expect(io).to receive(:puts).with ("Please choose between chinese or indian takeaway: ")
    expect(io).to receive(:gets).and_return("chinese")
    expect(io).to receive(:puts).with ("Chinese Takeaway Menu")
    expect(io).to receive(:puts).with ("------------------------------------")
    expect(io).to receive(:puts).with(["01 - Egg Fried Rice - £2.50", "02 - Prawn Toast - £5.00"])
    customer_order = CustomerOrder.new(io)
    customer_order.show_menu
  end

  it "takes customers order and then stops prior to going to verification screen" do
    io = double :io
    expect(io).to receive(:puts).with ("Please choose between chinese or indian takeaway: ")
    expect(io).to receive(:gets).and_return("chinese")
    expect(io).to receive(:puts).with ("Chinese Takeaway Menu")
    expect(io).to receive(:puts).with ("------------------------------------")
    expect(io).to receive(:puts).with(["01 - Egg Fried Rice - £2.50", "02 - Prawn Toast - £5.00"])
    expect(io).to receive(:puts).with("Enter the number of the dish you would like to add to your order (or 'remove' to remove a dish, or 'checkout' to finish): ")
    expect(io).to receive(:gets).and_return("01")
    expect(io).to receive(:puts).with("Egg Fried Rice added to your order")
    expect(io).to receive(:puts).with("Enter the number of the dish you would like to add to your order (or 'remove' to remove a dish, or 'checkout' to finish): ")
    expect(io).to receive(:gets).and_return("checkout")
    expect(io).to receive(:puts).with("Moving to order verification...")
    customer_order = CustomerOrder.new(io)
    customer_order.show_menu
    customer_order.build_order
  end

  it "user verifies their order" do
    io = double :io
    expect(io).to receive(:puts).with("Your order number 001 looks like this:")
    expect(io).to receive(:puts).with(["1. Egg Fried Rice - £2.50", "2. Prawn Toast - £5.00"])
    expect(io).to receive(:puts).with("---------------------\nTotal Cost: £7.50")
    expect(io).to receive(:puts).with("Are you happy with your order? (Y - to proceed(automatic payment), or N - to edit order): ")
    expect(io).to receive(:gets).and_return("y")
    verify = OrderVerify.new("001", [["Egg Fried Rice", 2.50], ["Prawn Toast", 5.00]], io)
    verify.verify
  end

# # 5 user adds dishes, verifies and receives text to confirm
# customer_order = CustomerOrder.new(001)
# chinese_menu = Menu.new(Chinese)
# customer_order.show_menu
# customer_order.add_dishes
# order_verify = OrderVerify.new
# order_verify.verify
# sms = OrderText(001).new
# sms.sms_confirmation => returns confirmation text message
end