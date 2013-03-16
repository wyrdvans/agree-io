class CreateParticipants < ActiveRecord::Migration
  def up
    MigrationAssist.create_uuid_pk_table "participants"
    add_column :participants, :term_id, :uuid
    add_column :participants, :email, :text
    add_column :participants, :created_at, :datetime
    add_index "participants", ["email"], name: "index_participants_on_email"
    add_index "participants", ["term_id"], name: "index_participants_on_term_id"
  end
  def down
    drop_table :participants
  end
end
