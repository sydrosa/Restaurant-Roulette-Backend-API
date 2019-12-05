class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.integer :user_id
      t.string :place_id
      t.float :place_lat
      t.float :place_lng
      t.text :place_name
      t.boolean :favorite, default: false

      t.timestamps
    end
  end
end
