require "customer_order"

# # 1 constructs the class
# chinese_order = CustomerOrder(001)
# chinese_order.order_number => "returns 001"

# # 2 shows menu, using a double for Menu class
# chinese_order = CustomerOrder(001)
# chinese_order.show_menu(chinese) => "returns mock chinese menu"

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