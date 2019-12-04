class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.integer :user_id
      t.integer :place_id
      t.float :place_lat
      t.float :place_lng
      t.text :place_name

      t.timestamps
    end
  end
end
