require 'twilio-ruby'

class OrderText
  def initialize(order_number, requester)
    @order_number = order_number
    @requester = requester
  end


  def sms_confirmation
    time_plus_one = Time.now + 1*60*60
    account_sid = "" # Details removed for github Your Test Account SID from www.twilio.com/console/settings
    auth_token = ""   # Deatils removed for github Your Test Auth Token from www.twilio.com/console/settings
  
    # replace text after @client = with @requester to pass rspec test
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
    body: "Thank you! Your order (#{@order_number}) was placed and will be delivered before #{time_plus_one.strftime("%H:%M")}",
    to: "+44771234567",    # Replace with your phone number
    from: "+15005550006")  # Use this Magic Number for creating SMS

    message.sid
  end
end

# text = OrderText.new("001", "requester")
# text.sms_confirmation