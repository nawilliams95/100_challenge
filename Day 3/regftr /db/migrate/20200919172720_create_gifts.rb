class CreateGifts < ActiveRecord::Migration[6.0]
  def change
    create_table :gifts do |t|
      t.string :name
      t.float :value
      t.string :event
      t.string :gift_giver
      t.timestamps
    end
  end
end
