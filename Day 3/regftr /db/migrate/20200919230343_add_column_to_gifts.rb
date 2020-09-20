class AddColumnToGifts < ActiveRecord::Migration[6.0]
  def change
    add_reference :gifts, :user_id, index: true
  end
end
