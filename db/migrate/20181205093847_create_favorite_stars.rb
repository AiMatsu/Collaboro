class CreateFavoriteStars < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_stars do |t|

      t.integer :f_user_id  , null: false
      t.integer :request_id , null: false

      t.timestamps
    end
  end
end
