class AddColumnUnconfirmedEmail < ActiveRecord::Migration[7.0]
  def change
    add_column :admins, :unconfirmed_email, :string
  end
end
