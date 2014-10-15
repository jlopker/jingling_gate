class ModelMailer < ActionMailer::Base
  default from: "website <inquiries@jinglinggate.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.new_record_notification.subject
  #
  def new_record_notification
    mail to: "inquiries@jinglinggate.com", subject: "Email from website"
  end
end
