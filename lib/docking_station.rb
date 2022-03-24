require_relative "bike"

class DockingStation
  attr_reader :bikes, :bike, :capacity
  
  def initialize(capacity=20)
    @bikes = []
    @capacity = capacity
  end

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end

  def dock(bike)
    fail 'Dock already full' if full?
    @bikes << bike
    @bike = bike
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
    @bike
  end

  private :full?, :empty?

end


