require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'docks bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  describe '#dock' do 
    it "Dock full" do
      subject.capacity.times do subject.dock(Bike.new) end
      expect { subject.dock(Bike.new) }.to raise_error 'Dock already full'
    end
  end

  it "creates bike then docks then releases" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  describe '#release_bike' do
    it "There are no bikes left" do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe 'can be initialized with a custom capacity' do 
    r = rand(100)
    station = DockingStation.new(r)
    it "initializes with #{r}" do
      expect(station.capacity).to eq(r)
    end
  end 

  describe 'will initialize with default capacity 20 if no custom capacity given' do
    station = DockingStation.new
    it "initializes with default capacity 20" do
      expect(station.capacity).to eq(20)
    end
  end

  describe 'will accept to dock a bike that is reported broken' do
    station = DockingStation.new
    broken_bike = Bike.new
    station.dock(broken_bike, working = false)
    it "docks the bike, adds it to bikes, changes its status to broken" do
      expect(station.bikes).to include(broken_bike)
      expect(broken_bike.working?).to be false
    end
  end
  it "docking station does not release broken bikes" do 
    docking_station = DockingStation.new
    bike = Bike.new
    docking_station.dock(bike, working = false)
    expect { docking_station.release_bike }.to raise_error("Bike not working")
  end
end

