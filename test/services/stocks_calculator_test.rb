require 'test_helper'

class Api::V1::StocksCalculatorTest < ActiveSupport::TestCase
  fixtures :stocks

  def setup
    @stocks = stocks(:stock1, :stock2)
  end

  test 'should calculate max gain' do
    calculator = Api::V1::StocksCalculator.new(@stocks)
    assert_equal '1000€', calculator.max_gain
  end
end