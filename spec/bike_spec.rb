require 'bike'

describe Bike do
  it "bike working" do 
  bike = Bike.new
  expect(bike).to respond_to :working?
  end
end




