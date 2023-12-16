class CreatePotatos < ActiveRecord::Migration[7.1]
  def change
    create_table :potatos do |t|

      t.timestamps
    end
  end
end
