require "menu"

describe "menu class" do
  it "returns an array of a chosen chinese menu" do
    menu = Menu.new("chinese")
    expect(menu.list_menu).to eq ["01 - Egg Fried Rice - £2.50", "02 - Prawn Toast - £5.00"]
  end
  
  it "returns an aray of a chosen indian menu" do
    menu = Menu.new("indian")
    expect(menu.list_menu).to eq ["01 - Onion Bhaji - £3.50", "02 - Chicken Korma - £7.00"]
  end

  it "returns dish name" do
    menu = Menu.new("chinese")
    expect(menu.dish_name("01")).to eq "Egg Fried Rice"
  end
  
  it "returns dish name" do
    menu = Menu.new("chinese")
    expect(menu.dish_name("02")).to eq "Prawn Toast"
  end

  it "returns dish price" do
    menu = Menu.new("chinese")
    expect(menu.dish_price("01")).to eq 2.50
  end
end