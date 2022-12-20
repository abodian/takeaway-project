require 'twilio-ruby'

class OrderText
  def initialize(order_number, requester)
    @order_number = order_number
    @requester = requester
  end


  def sms_confirmation
    time_plus_one = Time.now + 1*60*60
    account_sid = "" # Your Test Account SID from www.twilio.com/console/settings
    auth_token = ""   # Your Test Auth Token from www.twilio.com/console/settings

    @client = @requester  
    message = @client.messages.create(
    body: "Thank you! Your order (#{@order_number}) was placed and will be delivered before #{time_plus_one.strftime("%H:%M")}",
    to: "+447714241945",    # Replace with your phone number
    from: "+15005550006")  # Use this Magic Number for creating SMS

    message.sid
  end
end

# text = OrderText.new("001", (Twilio::REST::Client account_sid, auth_token))
# text.sms_confirmation