module MigrationAssist
  def self.create_uuid_pk_table table_name
    ActiveRecord::Base.connection.execute "CREATE TABLE #{table_name} (id uuid primary key default uuid_generate_v4())"
  end
end

