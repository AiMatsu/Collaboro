class CreateProposals < ActiveRecord::Migration[5.2]
  def change
    create_table :proposals do |t|

      t.integer  :f_user_id      , null: false
      t.string   :title        , null: false
      t.text     :body         , null: false
      t.text     :p_image_id
      t.string   :location     , null: false
      t.datetime :start_season , null: false
      t.datetime :finish_season, null: false
      t.integer  :category     , null: false, default: 0
      t.integer  :status       , null: false, default: 0

      t.timestamps

    end
  end
end
