class CreateRevisions < ActiveRecord::Migration
  def up
    MigrationAssist.create_uuid_pk_table "revisions"
    add_column :revisions, :term_id, :uuid
    add_column :revisions, :participant_id, :uuid
    add_column :revisions, :content, :text
    add_column :revisions, :created_at, :datetime
    add_index "revisions", ["term_id"], name: "index_revisions_on_term_id"
  end
  def down
    drop_table "revisions"
  end
end
