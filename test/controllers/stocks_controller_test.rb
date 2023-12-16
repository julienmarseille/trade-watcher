require 'test_helper'

class Api::V1::StocksControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get api_v1_stocks_path(stock_type: 'potato', time: '2023-01-01')
    assert_response :success
    assert_json_response_contains_attributes(['time', 'value'])
  end

  test 'should get max_gain' do
    get max_gain_api_v1_stocks_path(stock_type: 'potato', time: '2023-01-01')
    assert_response :success
  end

  test 'should return bad request for missing or invalid parameters' do
    get api_v1_stocks_path(stock_type: 'potato')
    assert_response :bad_request

    get api_v1_stocks_path(time: '2023-01-01')
    assert_response :bad_request

    get api_v1_stocks_path(stock_type: 'potato', time: 'invalid')
    assert_response :bad_request
  end

  private

  def assert_json_response_contains_attributes(attributes)
    json_response = JSON.parse(response.body)
    attributes.each { |attribute| assert_includes json_response.first, attribute }
  end
end