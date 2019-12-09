class AddGroupIdToProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :group, foreign_key: true
  end
end
