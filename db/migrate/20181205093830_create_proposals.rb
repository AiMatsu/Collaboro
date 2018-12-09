class CreateProposals < ActiveRecord::Migration[5.2]
  def change
    create_table :proposals do |t|

      t.integer  :f_user_id      , null: false
      t.string   :p_title        , null: false
      t.text     :p_body         , null: false
      t.text     :p_image_id
      t.string   :p_location     , null: false
      t.datetime :p_start_season , null: false
      t.datetime :p_finish_season, null: false
      t.integer  :p_category     , null: false, default: 0
      t.integer  :p_status       , null: false, default: 0

      t.timestamps

    end
  end
end
