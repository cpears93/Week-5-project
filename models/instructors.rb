require_relative( '../db/sql_runner' )

class Instructor

  attr_reader( :customer_id, :fitness_id, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id']
    @fitness_id = options['fitness_id']
  end

  def save()
    sql = "INSERT INTO instructors
    (
      customer_id,
      fitness_id
      )
      values
      (
        $1, $2
      )
      RETURNING id"
      values = [@customer_id, @fitness_id]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
    end

    def fitness
      sql = "SELECT v.* FROM fitness v INNER JOIN customer b ON b.fitness_id = v.id WHERE b.instructor_id = $1;"
      values = [@id]
      results = SqlRunner.run(sql, values)
      return results.map { |fitness| Fitness.new(fitness) }
    end

    def self.all()
      sql = "SELECT * FROM instructors"
      results = SqlRunner.run( sql )
      return results.map { |hash| Instructor.new( hash ) }
    end

    def self.find( id )
      sql = "SELECT * FROM instructors WHERE id = $1"
      values = [id]
      results = SqlRunner.run( sql, values )
      return Instructor.new( results.first )
    end

    def self.delete_all
      sql = "DELETE FROM instructors"
      SqlRunner.run( sql )
    end

  end
