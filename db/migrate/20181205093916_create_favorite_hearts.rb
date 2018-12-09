class CreateFavoriteHearts < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_hearts do |t|

      t.integer :c_user_id   , null: false
      t.integer :proposal_id , null: false

      t.timestamps

    end
  end
end
