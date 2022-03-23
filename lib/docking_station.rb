require_relative "bike"

class DockingStation
  attr_reader :bikes
  attr_reader :bike
 
  def initialize
    @bikes = []
  end

  def dock(bike)
    fail 'Dock already full' if @bikes.count >= 20
    @bikes << bike
    @bike = bike
  end


  def release_bike
    fail 'No bikes available' if @bikes.empty?
    @bikes.pop
    @bike
  end

end
