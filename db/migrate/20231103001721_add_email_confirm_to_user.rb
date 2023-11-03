class AddEmailConfirmToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email_confirm, :boolean
  end
end
