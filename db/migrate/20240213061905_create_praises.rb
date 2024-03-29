class CreatePraises < ActiveRecord::Migration[7.1]
  def change
    create_table :praises do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps

      t.index %i[user_id post_id], unique: true
    end
  end
end
