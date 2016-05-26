class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :lastname
      t.string :firstname
      t.string :secondname
      t.date :birthday
      t.integer :sex
      t.index [:lastname, :firstname, :secondname, :birthday], unique: true, name: :indexpeople
      t.timestamps null: false
    end
    reversible do |dir|
      dir.up do
        execute("ALTER TABLE people ADD CHECK(birthday>'1900-01-01')")
      end
    end
  end
end
