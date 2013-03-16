class CreateSignatures < ActiveRecord::Migration
  def change
    create_table "signatures", id: false, force: true do |t|
      t.uuid     "id",             null: false
      t.uuid     "participant_id"
      t.inet     "inet_address"
      t.macaddr  "mac_address"
      t.datetime "created_at"
    end
    add_index "signatures", ["participant_id"], name: "index_signatures_on_participant_id"
  end
end
