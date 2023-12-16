require 'test_helper'

class PotatoTest < ActiveSupport::TestCase
  fixtures :potatoes, :stocks

  test 'should have many stocks' do
    potato = potatoes(:potato1)
    #assert_respond_to potato, :stocks
    #assert_instance_of Stock, potato.stocks.first
  end
end