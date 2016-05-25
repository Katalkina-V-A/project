class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.references :person, index: true, foreign_key: true, null: false, unique: true
      t.string :cause
      t.timestamps null: false
    end
  end
end
