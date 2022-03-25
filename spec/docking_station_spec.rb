require 'docking_station'

describe DockingStation do
  let(:bike) { Bike.new }
  it { is_expected.to respond_to :release_bike }

  it 'docks bike' do
    expect(subject.dock(double(:bike)).to eq bike
  end

  it "Dock full" do
  subject.capacity.times do subject.dock(double(:bike)) end
    expect { subject.dock(double(:bike)) }.to raise_error 'Dock already full'
  end

  it "creates bike then docks then releases" do
  subject.dock(double(:bike))
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
  station = DockingStation.new
  station.dock(double(:bike), working = false)
    expect(station.bikes).to include(bike)
    expect(bike.working?).to be false
  end

  it "docking station does not release broken bikes" do 
    docking_station = DockingStation.new
    docking_station.dock(double(:bike), working = false)
    expect { docking_station.release_bike }.to raise_error("Bike not working")
  end

  it 'releases working bikes' do
    subject.dock double(:bike)
    bike = subject.release_bike
    expect(bike).to be_working
  end
end

