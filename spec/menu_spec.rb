require "menu"

describe "menu class" do
  it "returns an aray of a chosen menu" do
    menu = Menu.new("chinese")
    expect(menu.list_array).to eq $menu_list
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
    expect(menu.dish_price("01")).to eq 2.00
  end
end