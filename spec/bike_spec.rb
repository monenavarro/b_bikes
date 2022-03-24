require 'bike'

describe Bike do
  it "bike working" do 
  bike = Bike.new
  expect(bike).to respond_to :working?
  end

  it "is no longer working once it has been reported broken" do
    bike = Bike.new
    bike.report_broken
    expect(bike.working?).to eq false
  end
end




