require 'test_helper'

class Api::V1::StocksGeneratorTest < ActiveSupport::TestCase
  fixtures :potatoes  # Assuming you have a 'potatoes' fixture for stockable_type

  def setup
    @time = Time.zone.now
    @stock_type = 'Potato'
  end

  test 'should generate stocks for Potato' do
    generator = Api::V1::StocksGenerator.new(time: @time, stock_type: @stock_type)
    stocks = generator.call

    assert_equal stocks.count, ActiveSupport::Duration::SECONDS_PER_DAY
    assert_equal stocks.first.stockable_type, @stock_type
  end
end