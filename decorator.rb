# The ideology of decorator states that, We should not interfere already existed classes or an objects.
# Instead we can add a code if we want to extend the functionality.

class Car
  def roof
    'fixed'
  end
end

class ConvertibleDecorator
  def initialize(car)
    @car = car
  end

  def roof
    'collapsible'
  end

  def self.decorate(car)
    new(car)
  end
end

basicCar1 = Car.new
basicCar2 = Car.new

basicCar1 = ConvertibleDecorator.decorate(basicCar1)

puts(basicCar1.roof) # => collapsible
puts(basicCar2.roof) # => fixed
