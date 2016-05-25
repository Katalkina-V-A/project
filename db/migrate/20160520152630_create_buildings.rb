class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.integer :numb
      t.integer :typebuild, null: false, array: true, default: []
      t.integer :floor
      t.integer :state
      t.integer :quantityroom
      t.text :note

      t.index :address, unique: true

      t.timestamps null: false
    end
    reversible do |dir|
      dir.up do
        execute("ALTER TABLE buildings ADD CHECK(floor>0)")
      end
    end
  end
end
