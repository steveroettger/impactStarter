class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer  :owner_id
      t.integer  :invitee_id
      t.string   :linkedin_id
      t.text     :message
      t.datetime :delivered_at

      t.timestamps
    end
  end
end
