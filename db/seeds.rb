User.create(email: "test@mail.com", password: "123456", admin: true)
user = User.create(email: "test2@mail.com", password: "123456")
event = Event.create(name: "Event", start_at: 3.day.from_now, capacity: 10)
Participant.create(user: user, event: event)