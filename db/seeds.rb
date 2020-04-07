require_relative( "../models/customers.rb" )
require_relative( "../models/instructors.rb" )
require_relative( "../models/fitness.rb" )
require("pry-byebug")

Customer.delete_all()
Instructor.delete_all()
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


bookings1 = bookings1.new({
  "customer_id" => customer1.id,
  "fitness_id" => fitness1.id
  })

bookings1.save()

bookings2 = bookings2.new({
  "customer_id" => customer2.id,
  "fitness_id" => fitness2.id
  })

bookings2.save()

bookings3 = bookings3.new({
  "customer_id" => customer3.id,
  "fitness_id" => fitness3.id
  })

bookings3.save()

bookings4 = bookings4.new({
  "customer_id" => customer4.id,
  "fitness_id" => fitness4.id
  })

bookings4.save()


fitness_class1 = Fitness_class.new({
  "lesson_name" => lesson_name1.id
  })

fitness_class1.save()

fitness_class2 = Fitness_class.new({
  "lesson_name" => lesson_name2.id
  })

fitness_class2.save()

fitness_class3 = Fitness_class.new({
  "lesson_name" => lesson_name3.id
  })

fitness_class3.save()

fitness_class4 = Fitness_class.new({
  "lesson_name" => lesson_name4.id
  })

fitness_class4.save()

binding.pry
nil
