namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Dustin Taylor",
                 email: "taylordustingar@gmail.com",
                 password: "password",
                 password_confirmation: "password",
                 admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end