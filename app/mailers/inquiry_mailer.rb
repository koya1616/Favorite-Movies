class InquiryMailer < ApplicationMailer
  
  def received_email(inquiry)
    @inquiry = inquiry
    mail(:to => "190fe701@st.nufs.ac.jp", :subject => 'お問い合わせを承りました')
  end
  
end