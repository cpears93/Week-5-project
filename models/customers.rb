require_relative( '../db/sql_runner' )

class Customer

  attr_accessor( :first_name, :last_name, :age, :gender, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age'].to_i
    @gender = options['gender']
  end

  def save()
    sql = "INSERT INTO customers
    (
      first_name,
      last_name,
      age,
      gender
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@first_name, @last_name, @age, @gender]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM customers"
    results = SqlRunner.run( sql )
    return results.map { |customer| Customer.new( customer ) }
  end

  def fitness()
    sql = "SELECT * FROM fitness
    WHERE id = $1"
    values = [@fitness_id]
    results = SqlRunner.run( sql, values )
    return Fitness.new( results.first )
  end

  def instructor()
    sql = "SELECT * FROM instructor
    WHERE id = $1"
    values = [@instructor_id]
    results = SqlRunner.run( sql, values )
    return Instructor.new( results.first )
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run( sql )
  end

  def self.destroy(id)
    sql = "DELETE FROM customers
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

end
