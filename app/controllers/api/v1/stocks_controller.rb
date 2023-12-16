class Api::V1::StocksController < ApplicationController
  before_action :validate_params, only: [:index, :max_gain]

  def index
    render json: find_or_create_stocks.select(:time, :value).as_json(except: :id)
  end

  def max_gain
    render json: Api::V1::StocksCalculator.new(find_or_create_stocks).max_gain
  end

  private

  def query_params
    params.permit(:stock_type, :time)
  end

  def find_or_create_stocks
    time = query_params[:time].to_datetime
    stock_type = query_params[:stock_type].camelize
    stocks = Stock.where(stockable_type: stock_type, time: time..time.end_of_day)

    stocks.empty? ? Api::V1::StocksGenerator.new(time:, stock_type:).call : stocks
  end

  def validate_params
    unless valid_params?
      render json: { error: "stock_type and valid datetime are required parameters" }, status: :bad_request
    end
  end

  def valid_params?
    query_params[:stock_type].present? && valid_datetime?(query_params[:time])
  end

  def valid_datetime?(datetime_str)
    Date.strptime(datetime_str, '%Y-%m-%d')
    true
  rescue ArgumentError, TypeError
    false
  end
end
