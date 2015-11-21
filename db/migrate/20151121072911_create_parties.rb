class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name
      t.datetime :date
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :parties, :users
  end
end
