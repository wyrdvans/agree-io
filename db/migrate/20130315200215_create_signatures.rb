class CreateSignatures < ActiveRecord::Migration
  def up
    MigrationAssist.create_uuid_pk_table "signatures"
    add_column :signatures, :participant_id, :uuid, null: false
    add_column :signatures, :ip, :inet, null: false
    add_column :signatures, :mac, :macaddr, null: false
    add_column :signatures, :created_at, :timestamp
    add_index "signatures", ["participant_id"], name: "index_signatures_on_participant_id"
  end
  def down
    drop_table :signatures
  end
end
