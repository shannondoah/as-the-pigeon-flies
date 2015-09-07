class Message

  CLIENT = Twilio::REST::Client.new Rails.application.secrets.account_sid, Rails.application.secrets.auth_token

  def send(params)
    body = params[:message].split(%r{\s*})
    CLIENT.account.messages.create({
      from: '+16043371336',
      to: params[:to],
      body: "Incoming message from \"As the Pigeon Flies\"! Please stand by for transmission."})
    Thread.new do
      body.each do |message|
        CLIENT.account.messages.create({
          from: '+16043371336',
          to: params[:to],
          body: message})
        sleep 60
      end
    end
  end
end
