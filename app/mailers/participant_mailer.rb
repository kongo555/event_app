class ParticipantMailer < ApplicationMailer
  def join_email(participant)
    @user = participant.user
    @event = participant.event
    mail(to: "admin@mail.com", subject: "#{@user.email} joined #{@event.name}")
  end
end
