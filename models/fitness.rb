require_relative( '../db/sql_runner' )

class Fitness

  attr_reader( :lesson_name, :id)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @lesson_name = options['lesson_name']
  end

  def save()
    sql = "INSERT INTO fitness_class
    (
      lesson_name
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@lesson_name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def customer()
    sql = "SELECT z.* FROM customer z INNER JOIN fitness b ON B.customer_id = z.id WHERE b.fitness_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |instructor| Instructor.new(instructor) }
  end

  def self.all()
    sql = "SELECT * FROM fitness_class"
    results = SqlRunner.run( sql )
    return results.map { |fitness| Fitness.new( fitness ) }
  end

  def self.find()
    sql = "SELECT * FROM fitness_class
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Victim.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM fitness_class"
    SqlRunner.run( sql )
  end

end
