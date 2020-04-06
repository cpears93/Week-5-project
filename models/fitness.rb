require_relative( '../db/sql_runner' )

class Fitness

  attr_reader( :customer_id, :instructor_id, :id)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @customer_id = options['name']
    @instructor_id = options['instructor'].to_i
  end

  def save()
    sql = "INSERT INTO fitness
    (
      customer_id,
      insructor_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@customer_id, @instructor_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def instructor()
    sql = "SELECT z.* FROM customer z INNER JOIN instructors b ON B.instructor_id = z.id WHERE b.fitness_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |instructor| Instructor.new(instructor) }
  end

  def self.all()
    sql = "SELECT * FROM fitness"
    results = SqlRunner.run( sql )
    return results.map { |fitness| Fitness.new( fitness ) }
  end

  def self.find()
    sql = "SELECT * FROM fitness
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Victim.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM fitness"
    SqlRunner.run( sql )
  end

end
