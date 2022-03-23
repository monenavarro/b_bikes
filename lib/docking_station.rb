require_relative "bike"

class DockingStation
  attr_reader :bike

  def initialise
    @bike = []
  end

  def dock(bike)
    fail 'Dock already full' if @bike
    @bike = bike
  end

  def release_bike
    fail 'No bikes available' unless @bike
    @bike
  end

end
