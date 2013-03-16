class CreateParticipants < ActiveRecord::Migration
  def change
    create_table "participants", id: false, force: true do |t|
      t.uuid     "id",         null: false
      t.uuid     "term_id"
      t.text     "email"
      t.datetime "created_at"
    end
    add_index "participants", ["email"], name: "index_participants_on_email"
    add_index "participants", ["term_id"], name: "index_participants_on_term_id"
  end
end
