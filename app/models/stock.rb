class Stock < ApplicationRecord
  belongs_to :stockable, polymorphic: true
end