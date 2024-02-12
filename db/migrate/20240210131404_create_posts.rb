class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.references :user, foreign_key: true
      t.boolean :discard_flag, default: false
      t.datetime :deadline
      
      t.timestamps
    end
  end
end
