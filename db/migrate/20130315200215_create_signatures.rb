class CreateSignatures < ActiveRecord::Migration
  def up
    MigrationAssist.create_uuid_pk_table "signatures"
    add_column :signatures, :participant_id, :uuid, null: false
    add_column :signatures, :term_id, :uuid, null: false
    add_column :signatures, :ip, :inet
    add_column :signatures, :mac, :macaddr
    add_column :signatures, :created_at, :timestamp
    add_index "signatures", ["participant_id"]
    add_index "signatures", ["term_id", "participant_id"], unique: true
  end
  def down
    drop_table :signatures
  end
end
