require_relative "../lib/order_text"


describe "order_text class" do
  it "sends a confirmation text to the user" do
    client_double = double("Twilio::REST::Client")
    message_double = double("Twilio::REST::Message")
    allow(client_double).to receive(:messages).and_return(message_double)
    allow(message_double).to receive(:create).and_return(double(sid: "SM123"))

    text = OrderText.new("001", client_double)
    result = text.sms_confirmation

    expect(result).to eq("SM123")
    expect(message_double).to have_received(:create).with(hash_including(to: "+447714241945", from: "+15005550006"))
  end
end

