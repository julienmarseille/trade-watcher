require 'test_helper'

class StockTest < ActiveSupport::TestCase
  fixtures :stocks, :potatoes

  test 'should belong to potatoes' do
    stock = stocks(:stock1)
    #assert_respond_to stock, :stockable
    #assert_instance_of Potato, stock.stockable
  end
end