class CreateCuisinePreferences < ActiveRecord::Migration[6.0]
  def change
    create_table :cuisine_preferences do |t|
      t.integer :user_id
      t.integer :cuisine_id

      t.timestamps
    end
  end
end
