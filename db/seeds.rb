# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Customer.create([
  { first_name: 'Amy', last_name: 'Neufeld', phone: '(615) 867-5309' },
  { first_name: 'Sean', last_name: 'Hill', phone: '(715) 303-3707' },
  { first_name: 'Martin', last_name: 'Blakely', phone: '(615) 555-5555', delivery: true },
  { first_name: 'Jeff', last_name: 'Jensen', phone: '(615) 234-2349' },
  { first_name: 'James', last_name: 'Hulbert', phone: '(615) 234-2543' },
  { first_name: 'Rebecca', last_name: 'Brown', phone: '(615) 923-3231' },
  { first_name: 'Abby', last_name: 'Dowell', phone: '(615) 234-2543'},
  { first_name: 'Beth', last_name: 'Ramsey', phone: '(615) 154-7542'},
  { first_name: 'Bryan', last_name: 'DeCuir', phone: '(615) 290-2449'},
  { first_name: 'Sue', last_name: 'Curley', phone: '(615) 304-05438' },
  { first_name: 'Willy', last_name: 'Wonka', phone: '(999) 123-4567' }
])

CustomerLocation.create([
  { customer_id: 1, location_id: 1 },
  { customer_id: 2, location_id: 3 },
  { customer_id: 4, location_id: 2 },
  { customer_id: 5, location_id: 4 },
  { customer_id: 6, location_id: 5 },
  { customer_id: 7, location_id: 3 },
  { customer_id: 8, location_id: 3 },
  { customer_id: 9, location_id: 3 },
  { customer_id: 10, location_id: 3 },
])

Location.create([
  { name: 'CrossFit 615', phone: '(615) 580-5028'},
  { name: 'CrossFit Barefoot', phone: '(615) 617-9737'},
  { name: 'CrossFit West Nashville', phone: '(615) 428-7066'},
  { name: 'CrossFit Cool Springs', phone: '(208) 921-8845'},
  { name: 'CrossFit Gulch', phone: '(615) 293-4439'},
])

Address.create([
  { address1: '222 Heady Dr.', address2: 'BLDG 5', city: 'Nashville', zip: '37205', customer_id: 3 },
  { address1: '3231 Gallatin Pike', city: 'Nashville', zip: '37216', location_id: 1 },
  { address1: '5402 Charlotte Ave', city: 'Nashville', zip: '37209', location_id: 2 },
  { address1: '7097 Old Harding Rd', city: 'Nashville', zip: '37221', location_id: 3 },
  { address1: '1647 Mallory Ln', address2: '# 100', city: 'Brentwood', zip: '37027', location_id: 4 },
  { address1: '602 9th Ave S', city: 'Nashville', zip: '37203', location_id: 5 },
])

User.create([
  { first_name: 'Admin', email: 'admin@example.com', password: 'password', password_confirmation: 'password' }
])

Role.create([
  { name: 'Admin' },
  { name: 'Staff' }
])

UserRole.create([
  { user_id: 1, role_id: 1 }
])
