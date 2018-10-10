require "checkout"

RSpec.describe "" do

  it "show that 1 book costs 8.00 euro" do
    expect(basket_calc([1])).to eq(8.00)
  end

  it "show that 2 of the same book costs 16.00 euro" do
    expect(basket_calc([1,1])).to eq(16.00)
  end

  it "show that 2 different books costs 15.20 euro" do
    expect(basket_calc([1,2])).to eq(15.20)
  end

  it "show that 3 different books costs 21.60 euro" do
    expect(basket_calc([1,2,3])).to eq(21.60)
  end

  it "show that 4 different books costs 32.00 euro" do
    expect(basket_calc([1,2,3,4])).to eq(25.60)
  end

  it "show that 5 different books costs 30.00 euro" do
    expect(basket_calc([1,2,3,4,5])).to eq(30.00)
  end

  it "show that books of the same type will not be counted in the discount" do
    expect(basket_calc([1,2,1])).to eq(23.20)
  end

  it "show that 2 sets of books that should be discounted will discount both sets" do
    expect(basket_calc([1,2,3,1,2,3])).to eq(43.20)
  end

  it "show that sets of books that should be discounted will discount all sets" do
    expect(basket_calc([1,2,3,1,2,3,1])).to eq(51.20)
  end

  it "show that sets of books will always find the cheapest discount" do
    expect(basket_calc([1,1,2,2,3,3,4,5])).to eq(51.20)
  end

  it "show that sets of books will always find the cheapest discount" do
    expect(basket_calc([1,1,2,2,3,3,4,5,1,1,2,2,3,3,4,5])).to eq(102.40)
  end

  it "show that sets of books will always find the cheapest discount" do
    expect(basket_calc([1,1,1,2,2,2,3,3,3,4,5])).to eq(72.80)
  end

  it "show that sets of books will always find the cheapest discount" do
    expect(basket_calc([1,1,1,1,1,1,1,2,2,2,2,2,2,3,3,3,3,3,3,4,4,4,5,5,5])).to eq(161.60)
  end

end
