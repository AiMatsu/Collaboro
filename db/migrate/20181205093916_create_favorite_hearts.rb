class CreateFavoriteHearts < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_hearts do |t|

      t.references :c_user   , null: false
      t.references :proposal , null: false

      t.timestamps

    end
  end
end
