class CreateBuildingemployees < ActiveRecord::Migration
  def change
    create_table :buildingemployees do |t|
      t.references :employee, index: true, foreign_key: true, null: false
      t.references :building, index: true, foreign_key: true, null: false
      t.string :post
      t.string :cabinet
      t.string :phone
      t.time :startwork
      t.time :endwork
      t.text :note

      t.index [:employee_id, :post, :building_id], unique: true, name: :indexemployee

      t.timestamps null: false
    end
    reversible do |dir|
      dir.up do
        execute("ALTER TABLE buildingemployees ADD CHECK(startwork<endwork)")
      end
    end
  end
end
