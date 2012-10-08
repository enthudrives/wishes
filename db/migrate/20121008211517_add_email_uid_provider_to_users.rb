class AddEmailUidProviderToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :uid, :string
    add_column :users, :provider, :string
  end
end
