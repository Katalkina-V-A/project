class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.references :person, index: true, foreign_key: true, null: false, unique: true
      t.timestamps null: false
    end
  end
end
