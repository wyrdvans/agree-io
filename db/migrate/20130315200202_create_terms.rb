class CreateTerms < ActiveRecord::Migration 
  def up
    MigrationAssist.create_uuid_pk_table "terms"
    add_column :terms, :created_at, :datetime
  end
  def down
    drop_table :terms
  end
end
