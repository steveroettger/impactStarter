class AddPublicIdAndAcceptedToInvitations < ActiveRecord::Migration
  def change
    add_column 'invitations', 'accepted_at', :datetime
    add_column 'invitations', 'public_id', :string
  end
end
