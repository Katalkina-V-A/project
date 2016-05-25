class CreateVisitortenants < ActiveRecord::Migration
  def change
    create_table :visitortenants do |t|
      t.references :tenant, index: true, foreign_key: true, null: false
      t.references :visitor, index: true, foreign_key: true, null: false
      t.date :arrivaldate
      t.time :arrivaltime
      t.time :leavetime
      t.text :note
      t.index [:visitor_id, :tenant_id, :arrivaltime], unique: true, name: :indextenantvisitors
      t.timestamps null: false
    end
    reversible do |dir|
      dir.up do
        execute("ALTER TABLE visitortenants ADD CHECK(arrivaltime<leavetime)")
        execute("ALTER TABLE visitortenants ADD CHECK(arrivaldate>'2000-01-01')")
      end
    end
  end
end
