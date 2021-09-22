User.destroy_all


puts "🏕️ Seeding The journal..."

journalOne = Journal.create(journal_name: 'Its getting Personal now')


puts "✅ Done seeding!"


puts "🏕️ Seeding users..."

user1 = User.create(username: 'Lauren', password: 'nootone')
user2 = User.create(username: 'Rose', password: 'noottwo')
user3 = User.create(username: 'Kachaaa', password: 'nootthree')

puts "✅ Done seeding!"




puts "Seeding entries..."

# Signup.create(camper_id: camper1.id, activity_id: activity2.id, time: 11)

    review1 = Entry.create(
        date_time: 2,
        title: "Day 1",
        entry_text: "Not a good day",
        user_id: User.all.sample.id,
        journal_id: Journal.all.sample.id
        )
    

    review2 = Entry.create(
        date_time: 6,
        title: "oh my",
        entry_text: "This week could have been better, tbh",
        user_id: User.all.sample.id,
        journal_id: Journal.all.sample.id
        )

    review3 = Entry.create(
        date_time: 3,
        title: "Cute view",
        entry_text: "I kinda like working with a view.",
        user_id: User.all.sample.id,
        journal_id: Journal.all.sample.id
        )

puts "✅ Done seeding!"





