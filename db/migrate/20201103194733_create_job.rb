class CreateJob < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title, null: false
      t.string :level, null: false
      t.string :nature, null: false
      t.date :close_date, null: false

      t.timestamps
    end
  end
end
