class AddUserIdToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :user_id, :integer
    add_index :jobs, :user_id
  end
end
