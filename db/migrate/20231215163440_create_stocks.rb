class CreateStocks < ActiveRecord::Migration[7.1]
  def change
    create_table :stocks do |t|
      t.float :value, null: false
      t.datetime :time, null: false
      t.references :stockable, polymorphic: true, null: false
      t.timestamps
    end
  end
end
