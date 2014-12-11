class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|

     #t.datatype :column_name
      t.string :comment
      t.integer :articleID
      t.integer :userID

      t.timestamps
    end
  end
end
