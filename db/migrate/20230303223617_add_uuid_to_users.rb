class AddUuidToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :uuid, :string
    add_index :users, :uuid
  end
end
