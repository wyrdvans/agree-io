class CreateTerms < ActiveRecord::Migration
  def change
    create_table "terms", id: false, force: true do |t|
      t.uuid     "id",         null: false
      t.datetime "created_at"
    end
  end
end
