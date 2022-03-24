require_relative "bike"

class DockingStation
  attr_reader :bikes
  attr_reader :bike
 
  def initialize
    @bikes = []
  end

  def full?
    @bikes.count >= 20
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


