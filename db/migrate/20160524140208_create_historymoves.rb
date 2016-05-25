class CreateHistorymoves < ActiveRecord::Migration
  def change
    create_table :historymoves do |t|
      t.references :tenant, index: true, foreign_key: true, null: false
      t.references :room, index: true, foreign_key: true, null: false
      t.date :datein
      t.date :dateout
      t.text :note
      t.index [:tenant_id, :room_id, :datein], unique: true
      t.index [:tenant_id, :room_id, :dateout], unique: true
      t.timestamps null: false
    end
    reversible do |dir|
      dir.up do
        execute("ALTER TABLE historymoves ADD CHECK(datein<dateout)")
      end
    end
  end
end
