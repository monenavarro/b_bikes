require 'docking_station'

describe DockingStation do
  let(:bike) { double :bike }
  it {is_expected.to respond_to :release_bike} 

  it 'docks bike' do
    allow(bike).to receive(:working?).and_return(true)
    station = DockingStation.new
    station.dock(bike)
    expect(bike).to be_working
  end

  it "Dock full" do
    subject.capacity.times { subject.dock(double(:bike)) }
    expect { subject.dock(double(:bike)) }.to raise_error 'Dock already full'
  end

  it "releases a bike" do
    allow(bike).to receive(:working?).and_return(true)
  subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  it "There are no bikes left" do
    expect { subject.release_bike }.to raise_error 'No bikes available'
  end

  it "can be initialized with a custom capacity" do
  station = DockingStation.new(100)
    expect(station.capacity).to eq(100)
  end

  it "initializes with default capacity 20" do
  station = DockingStation.new
    expect(station.capacity).to eq(20)
  end

  it "docks the bike, adds it to bikes, changes its status to broken" do
  allow(bike).to receive(:working?).and_return(false)
  station = DockingStation.new
  station.dock(bike)
    expect(station.bikes).to include(bike)
    expect(bike.working?).to be false
  end

  it "docking station does not release broken bikes" do 
  allow(bike).to receive(:working?).and_return(false)
    docking_station = DockingStation.new
    docking_station.dock(bike)
    expect { docking_station.release_bike }.to raise_error("Bike not working")
  end

  it 'releases working bikes' do
  allow(bike).to receive(:working?).and_return(true)
    subject.dock bike
    bike = subject.release_bike
    expect(bike).to be_working
  end
end

