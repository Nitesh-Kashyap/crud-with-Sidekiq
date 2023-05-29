class HardJob
  include Sidekiq::Job

  def perform(*args)
    puts "my name is niteshhhhhh"
  end
end
