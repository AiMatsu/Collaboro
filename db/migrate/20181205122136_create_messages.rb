class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|

      t.text    :text        ,null: false
      t.integer :chatroom_id ,null:false
      t.boolean :f_user      , default: true

      t.timestamps
    end
  end
end
