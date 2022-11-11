class AddColumnConfirmedAt < ActiveRecord::Migration[7.0]
  def change
    add_column :admins, :confirmed_at, :datetime
  end
end
