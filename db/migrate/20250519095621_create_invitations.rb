class CreateInvitations < ActiveRecord::Migration[8.0]
  def change
    create_table :invitations do |t|
      t.references :event, null: false, foreign_key: true
      t.references :attendee, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
