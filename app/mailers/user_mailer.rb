class UserMailer < ApplicationMailer
  def welcome
    @name = params[:name]
    subject = "登録完了"
    mail(to: params[:to], subject: subject)
  end
end
