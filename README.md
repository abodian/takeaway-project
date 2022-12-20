# Chinese Takeaway Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices.

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes.

As a customer
So that I can verify that my order is correct
I would like to see an itemised receipt with a grand total.

#twilio gem and doubles required
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

## 2. Design the Class System

┌─────────────────────────────┐        ┌───────────────────────────────┐
│                             │        │  Class: OrderSMS              │
│  Class: CustomerOrder       │        │                               │
│                             │        │ ----------------------------  │
│ --------------------------  │        │                               │
│                             │◄───────┤  - sms_confirmation           │
│  -select_dishes             │        │                               │
│  -order_time                │        │                               │
│  -order_verify?             │        │                               │
│                             │        │                               │
└────────────┬───────────────┬┘        └───────────────────────────────┘
             │               │
             │               │
             │               │
             │               │         ┌───────────────────────────────┐
             │               └────────►│  Class: OrderVerify           │
             ▼                         │                               │
┌────────────────────────────┐         │ ---------------------------   │
│                            │         │                               │
│  Class: Menu               │         │ - receipt                     │
│                            │         │                               │
│ -------------------------  │         │ - grand_total                 │
│                            │         │                               │
│ - list_dishes              │         │ - verify                      │
│ - dish_name                │         │                               │
│ - dish_price               │         │                               │
└────────────────────────────┘         │                               │
                                       │                               │
                                       └───────────────────────────────┘

See Class Design.excalidraw in project folder for further context behind design decisions

_Also design the interface of each class in more detail._

```ruby
class CustomerOrder
  def initialize(order_number)
    $order_number = order_number
    $customer_order = []
  end

  def order_number
    # returns order number
  end

  def show_menu(menu)
    # gets chinese menu from an instance of Menu class and formats list, storing in instance variable, returns to user
  end

  def add_dishes 
    # will prompt user to select dish numbers to build customer order, pushes dishes to $customer_order
  end

  def remove_dishes
    # will remove a dish from an order
  end

  def order_verify?
    # checks if customer has verified order, using instance of OrderVerify
    # calls OrderText if true
    # returns to add_dishes
  end
end

class Menu
  def initialize(cuisine)
    @chinese_menu = []
  end

  def list_array
    # returns an array of hashes containing dish number, dish name, dish price
  end

  def dish_name(number)
    # returns dish name based on dish number
  end

  def dish_price(number)
    # returns dish price based on dish number
  end
end

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
    
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby

# 1 lists a menu of dishes
customer_order = CustomerOrder.new(001)
chinese_menu = Menu.new(Chinese)
customer_order.show_menu => returns a list of the chinese menu to the user

# 2 user adds dishes and sees list of ordered dishes
customer_order = CustomerOrder.new(001)
chinese_menu = Menu.new(Chinese)
customer_order.show_menu
customer_order.add_dishes
order_verify = OrderVerify.new
order_verify.receipt => returns an itemised list of dishes ordered

# 3 user adds dishes and verifies selection as correct
customer_order = CustomerOrder.new(001)
chinese_menu = Menu.new(Chinese)
customer_order.show_menu
customer_order.add_dishes
order_verify = OrderVerify.new
order_verify.verify
customer_order.verify? => true

# 4 user adds dishes and verifies selection as incorrect
customer_order = CustomerOrder.new(001)
chinese_menu = Menu.new(Chinese)
customer_order.show_menu
customer_order.add_dishes
order_verify = OrderVerify.new
order_verify.verify
customer_order.verify? => false

# 5 user adds dishes, verifies and receives text to confirm
customer_order = CustomerOrder.new(001)
chinese_menu = Menu.new(Chinese)
customer_order.show_menu
customer_order.add_dishes
order_verify = OrderVerify.new
order_verify.verify
sms = OrderText(001).new
sms.sms_confirmation => returns confirmation text message

```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# CustomerOrder

# 1 constructs the class
chinese_order = CustomerOrder(001)
chinese_order.order_number => "returns 001"

# 2 shows menu, using a double for Menu class
chinese_order = CustomerOrder(001)
chinese_order.show_menu(chinese) => "returns mock chinese menu"

# 3 asks user to add dishes and returns the customer order
chinese_order = CustomerOrder(001)
chinese_order.show_menu(chinese)
chinese_order.add_dishes # use doubles to simulate user input
chinese_order.return_order => returns an array of customer_order

# 4 returns to add dishes if user verifies order as false
chinese_order = CustomerOrder(001)
verify = OrderVerify.new # double
chinese_order.show_menu(chinese)
chinese_order.add_dishes
verify.verify # false
chinese_order.order_verify? => returns false

# Menu

# 1 constructs class
menu = Menu.new(chinese)
menu.list_array => returns an array of chinese menu

# 2 returns dish_name
menu = Menu.new(chinese)
menu.dish_name(01) => returns name of dish 01

# 3 returns dish_price
menu = Menu.new(chinese)
menu.dish_price(01) => returns price of dish 01

# OrderVerify

# 1 returns list of order
verify = OrderVerify.new
verify.receipt => returns itemised receipt of order

# 2 returns full cost of order
verify = OrderVerify.new
verify.grand_total => returns itemised receipt of order

# 3 asks the user to verify they are happy with the order - customer is happy
verify = OrderVerify.new
verify.verify => returns true

# 4 asks the user to verify they are happy with the order - customer is not happy
verify = OrderVerify.new
verify.verify => returns false

# OrderText

# 1 sends text
text = OrderText.new(001)
text.sms_confirmation => # returns (example) "Thank you! Your order (number) was placed and will be delivered before 18:52"
```


