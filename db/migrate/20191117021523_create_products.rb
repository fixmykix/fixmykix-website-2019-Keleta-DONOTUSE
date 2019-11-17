class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|

      t.string :title, default: ''
      t.text :description, default: ''
      t.integer :price, default: 0  
      t.boolean :published, default: false
      t.integer :user_id

      t.timestamps
    end
    add_index :products, :user_id
  end
end
