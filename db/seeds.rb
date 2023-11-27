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
WarehouseDivision.create!(division: "106M",
                          description: "Glasgow",
                          country: @c)
WarehouseDivision.create!(division: "201D",
                          description: "Leeds",
                          country: @c)
WarehouseDivision.create!(division: "305M",
                          description: "Warrington",
                          country: @c)
WarehouseDivision.create!(division: "405N",
                          description: "Belfast",
                          country: @c)
WarehouseDivision.create!(division: "406P",
                          description: "Nexus Point",
                          country: @c)
WarehouseDivision.create!(division: "408T",
                          description: "Tamworth",
                          country: @c)
WarehouseDivision.create!(division: "501G",
                          description: "Bristol",
                          country: @c)
WarehouseDivision.create!(division: "504M",
                          description: "Swansea",
                          country: @c)
WarehouseDivision.create!(division: "602J",
                          description: "Bexhill",
                          country: @c)
WarehouseDivision.create!(division: "606R",
                          description: "Enterprise",
                          country: @c)
WarehouseDivision.create!(division: "703M",
                          description: "Ruislip",
                          country: @c)
WarehouseDivision.create!(division: "706S",
                          description: "Romford",
                          country: @c)
WarehouseDivision.create!(division: "908B",
                          description: "Southampton",
                          country: @c)

99.times do |n|
  division  = "D#{n}"
  description = Faker::Address.city.truncate(40)
  WarehouseDivision.create!(division: division,
  description: description, 
  country: @c)
end

# Create Storage Locations
StorageLocation.create!(storage_location: 1001,
                          short_desc: "MAIN",
                          description: "Main Warehouse")
StorageLocation.create!(storage_location: 1002,
                          short_desc: "OPO",
                          description: "OPO Location")
StorageLocation.create!(storage_location: 1003,
                          short_desc: "CDOC",
                          description: "Cross Dock")
StorageLocation.create!(storage_location: 1004,
                          short_desc: "CONS",
                          description: "Consignment")
StorageLocation.create!(storage_location: 1005,
                          short_desc: "OFFS",
                          description: "Off-Site")
StorageLocation.create!(storage_location: 3001,
                          short_desc: "VRET",
                          description: "Vendor Returns")
StorageLocation.create!(storage_location: 3002,
                          short_desc: "CRET",
                          description: "Customer Returns")
StorageLocation.create!(storage_location: 4001,
                          short_desc: "QUAR",
                          description: "Quarantine")
StorageLocation.create!(storage_location: 4002,
                          short_desc: "SCRP",
                          description: "Scrappage")

# Create Stock Types
StockType.create!(stock_type: "U",
                          short_desc: "URES",
                          description: "Unrestricted")

StockType.create!(stock_type: "B",
                          short_desc: "BLCK",
                          description: "Blocked")

StockType.create!(stock_type: "Q",
                          short_desc: "QI",
                          description: "Quality Inspection")

StockType.create!(stock_type: "T",
                          short_desc: "TRAN",
                          description: "In Transit")

# Create Location Type
LocationType.create!(location_type: "S",
                          short_desc: "PICK",
                          description: "Pick Location")

LocationType.create!(location_type: "P",
                          short_desc: "PALL",
                          description: "Pallet Location")

LocationType.create!(location_type: "L",
                          short_desc: "LP",
                          description: "Licence Plate")   

LocationType.create!(location_type: "W",
                          short_desc: "OWIP",
                          description: "Order WIP") 

# Create Product Type
ProductType.create!(product_type: "C",
                          short_desc: "CTRL",
                          description: "Controlled")

ProductType.create!(product_type: "F",
                          short_desc: "FLAM",
                          description: "Flammable")

ProductType.create!(product_type: "M",
                          short_desc: "CYTO",
                          description: "Cyto-Toxic")   

ProductType.create!(product_type: "N",
                          short_desc: "CYFR",
                          description: "Cyto-Fridge")

ProductType.create!(product_type: "R",
                          short_desc: "FRID",
                          description: "Fridge")                        

# end