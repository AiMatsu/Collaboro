class CreateCropsCalendars < ActiveRecord::Migration[5.2]
  def change
    create_table :crops_calendars do |t|

      t.integer  :f_user_id  , null: false
      t.string   :crops      , null: false
      t.integer  :Jan        , null: false, default: 0
      t.integer  :Feb        , null: false, default: 0
      t.integer  :Mar        , null: false, default: 0
      t.integer  :Apr        , null: false, default: 0
      t.integer  :May        , null: false, default: 0
      t.integer  :Jun        , null: false, default: 0
      t.integer  :Jul        , null: false, default: 0
      t.integer  :Aug        , null: false, default: 0
      t.integer  :Sep        , null: false, default: 0
      t.integer  :Oct        , null: false, default: 0
      t.integer  :Nov        , null: false, default: 0
      t.integer  :Dec        , null: false, default: 0

      t.timestamps
    end
  end
end

