class CreateFavoriteStars < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_stars do |t|

      t.references :f_user  , null: false
      t.references :request , null: false

      t.timestamps
    end
  end
end
