  def remove_dishes
    @io.puts "Enter the NAME of the dish you would like to remove from your order(or 'checkout' to finish): "
    dish_name = @io.gets.chomp
    return @order_complete = true if dish_name == "checkout"
  
    chosen_dish_details = @menu_hash.values.find { |dish| dish[0].downcase == dish_name }
    return @io.puts "Sorry, that dish does not exist. Please try again." unless chosen_dish_details
  
    @io.puts "Enter the number of dishes to remove: "
    num_dishes = @io.gets.chomp.to_i
    num_dishes.times do
      index = @customer_order.index { |dish| dish[0].downcase == dish_name }
      return @io.puts "Sorry, there are no more dishes of that type in your order." unless index
  
      @customer_order.delete_at(index)
    end
    @io.puts "#{num_dishes.to_s} x #{dish_name.upcase} removed from your order"
  end
