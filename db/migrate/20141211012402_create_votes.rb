class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|

      #t.datatype :column_name
      t.integer :articleID
      t.integer :userID
      t.integer :numVotes

      t.timestamps
    end
  end
end
