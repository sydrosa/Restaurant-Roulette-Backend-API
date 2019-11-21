class AddFavoriteToMatches < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :favorite, :boolean
  end
end
