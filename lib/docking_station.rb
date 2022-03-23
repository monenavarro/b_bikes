require_relative "bike"

class DockingStation
  attr_reader :bikes

  def initialise
    @bikes = []
  end

  def dock(bike)
    fail 'Dock already full' if @bikes.count >= 20
    @bikes << bike
  end

  def release_bike
    fail 'No bikes available' unless @bikes.empty?
    @bikes.pop
  end

end
