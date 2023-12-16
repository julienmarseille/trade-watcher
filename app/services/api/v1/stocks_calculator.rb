class Api::V1::StocksCalculator

  def initialize(params)
    @stocks = params
    @stock_type = Stock.last.stockable_type.constantize
  end

  def max_gain
    min_price = @stocks.first.value
    max_gain = @stocks.reduce(0) do |max, stock|
      min_price = [min_price, stock.value].min
      [max, stock.value - min_price].max
    end

    format(max_gain * @stock_type::MAX_TRADE_PER_DAY)
  end

  private

  def format(max_gain)
    "#{max_gain.round}€"
  end
end