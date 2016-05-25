class CreateLinenattenants < ActiveRecord::Migration
  def change
    create_table :linenattenants do |t|
      t.references :tenant, index: true, foreign_key: true, null: false
      t.references :linen, index: true, foreign_key: true, null: false
      t.integer :quantity, null: false
      t.index [:tenant_id, :linen_id], unique: true
      t.timestamps null: false
    end
    reversible do |dir|
      dir.up do
        execute("ALTER TABLE linenattenants ADD CHECK(quantity>=0)")
      end
    end
  end
end
