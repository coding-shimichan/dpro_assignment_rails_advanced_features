class SendWelcomeEmailJob < ApplicationJob
  queue_as :mailers

  def perform(user)
    @user = user
    UserMailer.with(to: @user.email, name: @user.name).welcome.deliver_later(wait: 2.minutes)
  end
end
