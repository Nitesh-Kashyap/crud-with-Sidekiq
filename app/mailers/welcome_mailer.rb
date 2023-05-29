class WelcomeMailer < ApplicationMailer
     def send_welcome_mail(project)
          @project = project
          @url = project_url(@project)
          mail(to: 'nitesh.krjs@gmail.com', subject: "#{project.name} newly added to project list!")
     end
end