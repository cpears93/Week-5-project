require_relative( "../models/customers.rb" )
require_relative( "../models/bookings.rb" )
require_relative( "../models/fitness.rb" )
require("pry-byebug")

Customer.delete_all()
Booking.delete_all()
Fitness.delete_all()

customer1 = Customer.new({
  "first_name" => "Ted",
  "last_name" => "Crilly",
  "age" => 31,
  "gender" => "Male"
  })

customer1.save()

customer2 = Customer.new({
  "first_name" => "Joan",
  "last_name" => "Doyle",
  "age" => 29,
  "gender" => "Female"
  })

customer2.save()

customer3 = Customer.new({
  "first_name" => "Dougal",
  "last_name" => "McGuire",
  "age" => 26,
  "gender" => "Male"
  })

customer3.save()

customer4 = Customer.new({
  "first_name" => "Jack",
  "last_name" => "Hackett",
  "age" => 32,
  "gender" => "Male"
  })

customer4.save()

fitness_class1 = Fitness.new({
  "lesson_name" => "Weightlifting"
  })

fitness_class1.save()

fitness_class2 = Fitness.new({
  "lesson_name" => "Spin"
  })

fitness_class2.save()

fitness_class3 = Fitness.new({
  "lesson_name" => "Rowing"
  })

fitness_class3.save()

fitness_class4 = Fitness.new({
  "lesson_name" => "Treadmill"
  })

fitness_class4.save()

bookings1 = Booking.new({
  "customer_id" => customer1.id,
  "fitness_id" => fitness_class1.id
  })

bookings1.save()

bookings2 = Booking.new({
  "customer_id" => customer2.id,
  "fitness_id" => fitness_class2.id
  })

bookings2.save()

bookings3 = Booking.new({
  "customer_id" => customer3.id,
  "fitness_id" => fitness_class3.id
  })

bookings3.save()

bookings4 = Booking.new({
  "customer_id" => customer4.id,
  "fitness_id" => fitness_class4.id
  })

bookings4.save()

binding.pry
nil
