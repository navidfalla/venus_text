class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def reply
    message_body = params["Body"]
    from_number = params["From"]
    if message_body == "1" || message_body == "2"
      boot_twilio
      sms = @client.messages.create(
        from: Rails.application.secrets.twilio_number,
        to: from_number,
        body: "You got it. You'll receive a pretty pink package in two days."
      )
    end
    products = ProductSelectorService.product_selector(message_body)
    response1 = products.first.to_s.capitalize
    response2 = products.last.to_s.capitalize
    if products == []
      boot_twilio
      sms = @client.messages.create(
        from: Rails.application.secrets.twilio_number,
        to: from_number,
        body: "I couldn't any products that match your needs, could you be more specific?"
      )
    else
      boot_twilio
      sms = @client.messages.create(
        from: Rails.application.secrets.twilio_number,
        to: from_number,
        body: "These products\n1. #{response1} \n2. #{response2} \nmatch your needs. \nRespond the number you'd rather to order to have it delivered to you in 2 days or 3 for another product."
      )
    end
  end

  private
  def boot_twilio
    account_sid = Rails.application.secrets.twilio_sid
    auth_token = Rails.application.secrets.twilio_token
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
