require "order_verify"

describe "order verify class" do
  it "prints order and prompts user to validate true" do
    io = double :io
    expect(io).to receive(:puts).with("Your order number 001 looks like this:")
    expect(io).to receive(:puts).with(["1. Egg Fried Rice - £2.50", "2. Prawn Toast - £5.00"])
    expect(io).to receive(:puts).with("---------------------\nTotal Cost: £7.50")
    expect(io).to receive(:puts).with("Are you happy with your order? (Y - to proceed(automatic payment), or N - to edit order): ")
    expect(io).to receive(:gets).and_return("y")
    verify = OrderVerify.new("001", [["Egg Fried Rice", 2.50], ["Prawn Toast", 5.00]], io)
    expect(verify.verify).to eq true
  end 
  
  it "prints order and prompts user to validate false" do
    io = double :io
    expect(io).to receive(:puts).with("Your order number 001 looks like this:")
    expect(io).to receive(:puts).with(["1. Egg Fried Rice - £2.50", "2. Prawn Toast - £5.00"])
    expect(io).to receive(:puts).with("---------------------\nTotal Cost: £7.50")
    expect(io).to receive(:puts).with("Are you happy with your order? (Y - to proceed(automatic payment), or N - to edit order): ")
    expect(io).to receive(:gets).and_return("n")
    verify = OrderVerify.new("001", [["Egg Fried Rice", 2.50], ["Prawn Toast", 5.00]], io)
    expect(verify.verify).to eq false
  end 
end