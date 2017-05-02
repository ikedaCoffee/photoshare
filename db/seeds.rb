100.times do |n|
  email = Faker::Internet.email
  password = "password"
  User.create!(
    name: "ユーザー#{n + 1}",
    email: email,
    password: password,
    password_confirmation: password,
    )
end

100.times do |n|
  n += 1
  Photo.create(
    title: "user_id: #{n}",
    content: "hogehoge",
    user_id: n
  )
end
