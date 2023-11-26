# Create a main sample user.
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

# Create a real user.
User.create!(name:  "Andrew Norton",
email: "andrew.norton84@hotmail.com",
password:              "xxx123",
password_confirmation: "xxx123",
admin:     true,
activated: true,
activated_at: Time.zone.now)

# Generate a bunch of additional users.
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

# Generate microposts for a subset of users.
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(content: content) }
end

# Create following relationships.
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

# Create countries
@c = Country.create!(name: "UK",
                full_name: "Unitied Kindom")
Country.create!(name: "FR",
                full_name: "France")

99.times do |n|
  name  = "C#{n}"
  full_name = Faker::Address.country.truncate(40)
  Country.create!(name: name,
                full_name: full_name)
end

# Create divisions
WarehouseDivision.create!(division: "305M",
                          description: "Warrington",
                          country: @c)
WarehouseDivision.create!(division: "406P",
                          description: "Nexus Point",
                          country: @c)
99.times do |n|
  division  = "D#{n}"
  description = Faker::Address.city.truncate(40)
  WarehouseDivision.create!(division: division,
  description: description, 
  country: @c)
end
