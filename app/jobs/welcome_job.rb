class WelcomeJob < ApplicationJob
  sidekiq_options queue: :default , retry: 1
  def perform(project)
    WelcomeMailer.send_welcome_mail(project).deliver
  end
end