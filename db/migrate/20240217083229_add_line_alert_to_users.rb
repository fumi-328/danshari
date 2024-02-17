class AddLineAlertToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :line_alert, :boolean, default: true, null: false
  end
end
