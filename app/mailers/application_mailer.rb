class ApplicationMailer < ActionMailer::Base
  default from: "t('feedback_mailer.from')"
  layout "mailer"
  prepend_view_path "app/views/mailers"
  
end
