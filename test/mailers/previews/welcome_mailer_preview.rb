class WelcomeMailerPreview < ActionMailer::Preview
  def welcome
    WelcomeMailer.with(user: User.all.sample, fact: WelcomeServices::Welcome.new.welcome).welcome
  end
end