class UpdateColumnPasswordFromUser < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :passwor_digest, :password_digest
  end
end
