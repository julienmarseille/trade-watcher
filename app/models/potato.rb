class Potato < ApplicationRecord
  MAX_TRADE_PER_DAY = 100

  has_many :stocks, as: :stockable
end
