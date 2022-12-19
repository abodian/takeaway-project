require "order_verify"

describe "order verify class" do
  it "prints an itemised receipt" do
    verify = OrderVerify.new("001")
    expect(verify.receipt(["01 Test", "02 Test"])).to eq ["01 Test", "02 Test"]
  end

# # 1 returns list of order
# verify = OrderVerify.new
# verify.receipt => returns itemised receipt of order

# # 2 returns full cost of order
# verify = OrderVerify.new
# verify.grand_total => returns itemised receipt of order

# # 3 asks the user to verify they are happy with the order - customer is happy
# verify = OrderVerify.new
# verify.verify => returns true

# # 4 asks the user to verify they are happy with the order - customer is not happy
# verify = OrderVerify.new
# verify.verify => returns false
end