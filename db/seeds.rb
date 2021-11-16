User.create!(
  name: "Example User",
  account_name: "minhpro",
  email: "example@railstutorial",
  age: "12",
  gender: "male",
  password: "111111",
  password_confirmation: "111111",
  admin: true
)

30.times do |n|
  name = Faker::Name.name
  account_name = "trananhminh#{n+1}"
  email = "example-#{n+1}@railstutorial.org"
  age = "23"
  gender = "male"
  password = "password"
  User.create!(
    name: name,
    account_name: account_name,
    email: email,
    age: age,
    gender: gender,
    password: password,
    password_confirmation: password)
end
