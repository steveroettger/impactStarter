class AddSocialLinksToUsers < ActiveRecord::Migration
  def change
    add_column :users, :linkedin, :string,  after: :location
    add_column :users, :facebook, :string,  after: :linkedin
    add_column :users, :twitter, :string,  after: :facebook
  end
end
