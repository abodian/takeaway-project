require "customer_order"
require "menu"
require "order_text"
require "order_verify"

# # 1 lists a menu of dishes
# customer_order = CustomerOrder.new(001)
# chinese_menu = Menu.new(Chinese)
# customer_order.show_menu => returns a list of the chinese menu to the user

# # 2 user adds dishes and sees list of ordered dishes
# customer_order = CustomerOrder.new(001)
# chinese_menu = Menu.new(Chinese)
# customer_order.show_menu
# customer_order.add_dishes
# order_verify = OrderVerify.new
# order_verify.receipt => returns an itemised list of dishes ordered

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