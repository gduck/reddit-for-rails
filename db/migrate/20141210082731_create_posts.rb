class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

      #t.datatype :column_name
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
