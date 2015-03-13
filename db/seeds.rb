User.delete_all

user = User.create(
  first_name: "Felix",
  last_name: "Tester",
  email: "user@example.com",
  password: "password", password_confirmation: "password"
)

10.times do
  Rant.create!(
  title: Faker::Lorem.word,
  body: Faker::Lorem.paragraph,
  user_id: user.id
  )
end
