class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer   :user_id
      t.string    :stripe_user_id
      t.string    :access_token
      t.string    :stripe_publishable_key
      t.string    :scope
      t.timestamps null: false
    end
  end
end
