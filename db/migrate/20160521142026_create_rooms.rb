class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.references :building, index: true, foreign_key: true, null: false
      t.integer :numb, null: false
      t.integer :floor
      t.integer :section
      t.integer :place
      t.integer :typeroom
      t.integer :state
      t.boolean :fire
      t.boolean :signal
      t.boolean :samospas
      t.integer :accessory
      t.integer :accessoryfaculty
      t.text :note

      t.index [:building_id, :numb], unique: true

      t.timestamps null: false
    end
    reversible do |dir|
      dir.up do
        execute("ALTER TABLE rooms ADD CHECK(numb>0)")
      end
    end
  end
end
