class AddLinkedInItemsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :headline, :string, after: :last_name
    add_column :users, :location, :string, after: :headline
    add_column :users, :photo, :string, after: :location
  end
end
