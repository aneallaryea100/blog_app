class AddColumnConfirmationSentAt < ActiveRecord::Migration[7.0]
  def change
    add_column :admins, :confirmation_sent_at, :datetime
  end
end
