require "checkout"

RSpec.describe "" do

  it "show that 1 book costs 8.00 euro" do
    expect(basket_calc([1])).to eq(8.00)
  end

  it "show that 2 of the same book costs 16.00 euro" do
  end

  it "show that 2 different books costs 15.20 euro" do
  end

end
