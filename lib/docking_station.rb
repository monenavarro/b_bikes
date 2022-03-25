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

  def dock(bike, working = true)
    p working
    fail 'Dock already full' if full?
    p 'has not failed yet'
    if working == false 
      p 'we are now entering the loop'
      bike.report_broken 
      p bike.working?
    end
    @bikes << bike
    @bike = bike
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail "Bike not working" if !bike.working?
    @bikes.pop
    @bike
  end

  private :full?, :empty?

end


