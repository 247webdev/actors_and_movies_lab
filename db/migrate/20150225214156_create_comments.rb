class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :commentable_id
      t.string :type
      t.text :content

      t.timestamps
    end
  end
end
