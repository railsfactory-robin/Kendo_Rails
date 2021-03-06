class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_id
      t.string :product_name
      t.string :description
      t.float :price
      t.string :image_url

      t.timestamps null: false
    end
  end
end
