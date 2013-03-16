class CreateRevisions < ActiveRecord::Migration
  def change
    create_table "revisions", id: false, force: true do |t|
      t.uuid     "id",             null: false
      t.uuid     "term_id"
      t.uuid     "participant_id"
      t.text     "content"
      t.datetime "created_at"
    end
    add_index "revisions", ["term_id"], name: "index_revisions_on_term_id"
  end
end
