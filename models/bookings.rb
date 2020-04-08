require_relative( '../db/sql_runner' )

class Bookings

  attr_reader( :fitness_id, :customer_id, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @fitness_id = options['fitness_id']
    @customer_id = options['customer_id']
  end

  def save()
    sql = "INSERT INTO bookings
    (
      fitness_id,
      customer_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@fitness_id, @customer_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM bookings"
    results = SqlRunner.run( sql )
    return results.map { |bookings| Bookings.new( bookings ) }
  end

  def customers()
    sql = "SELECT * FROM customers
    WHERE id = $1"
    values = [@customer_id]
    results = SqlRunner.run( sql, values )
    return Customers.new( results.first )
  end

  def fitness_classes()
    sql = "SELECT * FROM fitness_class
    WHERE id = $1"
    values = [@fitness_id]
    results = SqlRunner.run( sql, values )
    return Fitness.new( results.first )
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
