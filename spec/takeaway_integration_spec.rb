require "customer_order"
require "menu"
require "order_text"
require "order_verify"

describe "takeaway integration" do
  it "returns the customers chosen menu" do
    io = double :io
    expect(io).to receive(:puts).with(["01 - Egg Fried Rice - £2.00", "02 - Prawn Toast - £5.00"])
    customer_order = CustomerOrder.new("chinese", io)
    customer_order.show_menu
  end

  # xit "takes customers order and then provides an itemised list of dishes chosen" do
  #   io = double :io
  #   expect(io).to receive(:puts).with("Enter the number of the dish you would like to add to your order (or 'remove' to remove a dish, or 'checkout' to finish): ")
  #   expect(io).to receive(:gets).and_return("01")
  #   expect(io).to receive(:puts).with("Egg Fried Rice added to your order")
  #   expect(io).to receive(:puts).with("Enter the number of the dish you would like to add to your order (or 'remove' to remove a dish, or 'checkout' to finish): ")
  #   expect(io).to receive(:gets).and_return("checkout")
  #   expect(io).to receive(:puts).with("Moving to order verification...")
  #   customer_order = CustomerOrder.new("chinese", io)
  #   customer_order.build_order
  #   order_verify = OrderVerify.new
  #   order_verify.receipt => returns an itemised list of dishes ordered
  # end
# # 2 user adds dishes and sees list of ordered dishes


# # 3 user adds dishes and verifies selection as correct
# customer_order = CustomerOrder.new(001)
# chinese_menu = Menu.new(Chinese)
# customer_order.show_menu
# customer_order.add_dishes
# order_verify = OrderVerify.new
# order_verify.verify
# customer_order.verify? => true

# # 4 user adds dishes and verifies selection as incorrect
# customer_order = CustomerOrder.new(001)
# chinese_menu = Menu.new(Chinese)
# customer_order.show_menu
# customer_order.add_dishes
# order_verify = OrderVerify.new
# order_verify.verify
# customer_order.verify? => false

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