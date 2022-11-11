class AddColumnConfirmationToken < ActiveRecord::Migration[7.0]
  def change
    add_column :admins, :confirmation_token, :string
  end
end