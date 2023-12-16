class Api::V1::StocksGenerator
  ARBITRARY_STOCK_VALUE = 100.00
  ARBITRARY_STOCK_MODIFIER = 0.1

  def initialize(time:, stock_type:)
    @stock_type = stock_type
    @time = time
  end

  def call
    klass_instance = @stock_type.constantize.create
    stock_value = ARBITRARY_STOCK_VALUE
    stocks_data = []

    ActiveSupport::Duration::SECONDS_PER_DAY.times do |i|
      stocks_data << {
        value: stock_value,
        time: @time + i.seconds,
        stockable_type: @stock_type,
        stockable_id: klass_instance.id
      }
      stock_value = (stock_value + rand(-ARBITRARY_STOCK_MODIFIER..ARBITRARY_STOCK_MODIFIER)).round(2)
    end

    Stock.insert_all(stocks_data)

    Stock.where(stockable: klass_instance)
  end
end