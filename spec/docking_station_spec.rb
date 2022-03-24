require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'docks bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  describe '#dock' do 
    it "Dock full" do
      subject.DEFAULT_CAPACITY.times do subject.dock(Bike.new) end
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

end

