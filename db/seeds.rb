User.delete_all
Rant.delete_all


user1 = User.create(
  first_name: "Felix",
  last_name: "Tester",
  email: "userf@example.com",
  password: "password", password_confirmation: "password"
)

10.times do
  Rant.create!(
  title: Faker::Lorem.word,
  body: Faker::Lorem.paragraph,
  user_id: user1.id
  )
end

user2 = User.create(
  first_name: "Mischa",
  last_name: "Tester",
  email: "userm@example.com",
  password: "password", password_confirmation: "password"
)

10.times do
  Rant.create!(
  title: Faker::Lorem.word,
  body: Faker::Lorem.paragraph,
  user_id: user2.id
  )
end
