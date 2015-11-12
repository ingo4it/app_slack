class AddRefreshTokenToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :refresh_token, :string
  end
end
