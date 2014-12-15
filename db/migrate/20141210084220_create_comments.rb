class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|

     #t.datatype :column_name
      t.string :comment
      t.integer :post_id 
      t.integer :user_id

      t.timestamps
    end
  end
end
