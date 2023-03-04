class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :company
      t.string :location
      t.date :posted_date
      t.date :expiration_date

      t.timestamps
    end
  end
end
