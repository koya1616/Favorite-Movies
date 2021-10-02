class InquiryMailer < ApplicationMailer
  default from: 'from@example.com'
  
  def received_email(inquiry)
    @inquiry = inquiry
    mail(:to => ENV['SEND_MAIL'], :subject => 'Webサイトからお問い合わせがありました。')
  end
  
end