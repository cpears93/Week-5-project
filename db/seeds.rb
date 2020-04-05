require_relative( "../models/customer.rb" )
require_relative( "../models/instructor.rb" )
require_relative( "../models/fitness_class.rb" )
require("pry-byebug")

Customer.delete_all()
Instructor.delete_all()
Fitness.delete_all()

customer1 = Customer.new({
  "first_name" => "Ted",
  "last_name" => "Crilly"
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


insructor1 = Instructor.new({
  "instructor_name" => "Jack",
  "fitness_class" => "Spin"
  })

instructor1.save()

instructor2 = Instructor.new({
  "insructor_name" => "Victor",
  "fitness_class" => "Rowing"
  })

instructor2.save()

instructor3 = Instructor.new({
  "instructor_name" => "Tam",
  "fitness_class" => "Kickboxing"
  })

instructor3.save()

instructor4 = Instructor.new({
  "instructor_name" => "Winston",
  "fitness_class" => "Weightlifting"
  })

instructor4.save()


class1 = Class.new({
  "customer_id" => customer1.id,
  "instructor_id" => instructor1.id
  })

class1.save()

class2 = Class.new({
  "customer_id" => customer3.id,
  "instructor_id" => instructor2.id
  })

class2.save()

class3 = Class.new({
  "customer_id" => customer4.id,
  "instructor_id" => instructor3.id
  })

class3.save()

class4 = Class.new({
  "customer_id" => customer2.id,
  "instructor_id" => instructor4.id
  })

class4.save()
