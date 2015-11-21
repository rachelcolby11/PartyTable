class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.string :category
      t.integer :duration
      t.datetime :start_time
      t.datetime :end_time
      t.references :party, index: true

      t.timestamps null: false
    end
    add_foreign_key :tasks, :parties
  end
end
