class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.attachment :avatar
      t.boolean :security
      t.string :phone
      t.date :arrivaldate
      t.date :checkoutdate
      t.text :note
      t.references :resident, polymorphic: true, index: true, null: false

      t.timestamps null: false
    end
    reversible do |dir|
      dir.up do
        execute("ALTER TABLE tenants ADD CHECK(arrivaldate<checkoutdate)")
        execute("ALTER TABLE tenants ADD CHECK(arrivaldate>'1950-01-01')")
      end
    end
  end
end
