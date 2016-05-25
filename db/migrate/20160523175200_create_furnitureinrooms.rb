class CreateFurnitureinrooms < ActiveRecord::Migration
  def change
    create_table :furnitureinrooms do |t|
      t.references :furniture, index: true, foreign_key: true, null: false
      t.references :room, index: true, foreign_key: true, null: false
      t.integer :quantity, null: false

      t.index [:furniture_id, :room_id], unique: true, name: :roomfurniture

      t.timestamps null: false
    end
    reversible do |dir|
      dir.up do
        execute("ALTER TABLE furnitureinrooms ADD CHECK(quantity>=0)")
      end
    end
  end
end
