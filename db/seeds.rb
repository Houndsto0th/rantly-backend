User.delete_all

User.create(
  first_name: "Felix",
  last_name: "Tester",
  email: "user@example.com",
  password: "password", password_confirmation: "password"
)
