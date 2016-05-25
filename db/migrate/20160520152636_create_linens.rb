class CreateLinens < ActiveRecord::Migration
  def change
    create_table :linens do |t|
      t.references :building, index: true, foreign_key: true, null: false
      t.string :name, null: false
      t.integer :quantity, null: false
      t.string :size
      t.text :note

      t.index [:building_id, :name], unique: true

      t.timestamps null: false
    end
    reversible do |dir|
      dir.up do
        execute("ALTER TABLE linens ADD CHECK(quantity>=0)")
      end
    end
  end
end
