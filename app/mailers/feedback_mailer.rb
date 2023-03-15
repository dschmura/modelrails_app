class FeedbackMailer < ApplicationMailer
  default from: "t('feedback_mailer.from')"

  def send_feedback(feedback)
    @greeting = "This is a greeting"
    @body = "This message was generated by a default template. To customize your message, look at app/mailers/feedback_mailer.rb"
    mail to: "dave@humbledaisy.com", subject: @greeting, from: feedback.email, bcc: feedback.email
  end

end