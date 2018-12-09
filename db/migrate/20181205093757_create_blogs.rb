class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|

      t.integer :f_user_id , null: false
	    t.string  :b_title   , null: false
      t.text    :b_body    , null: false
      t.text    :b_image_id
      t.integer :b_category, null: false, default: 0

      t.timestamps


    end
  end
end
