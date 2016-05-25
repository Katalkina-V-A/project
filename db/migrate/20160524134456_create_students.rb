class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.references :person, index: true, foreign_key: true, null: false, unique: true
      t.integer :faculty, null: false
      t.integer :typegroup
      t.string :group
      t.date :receiptdate
      t.date :expirationdate
      t.integer :chair
      t.integer :course
      t.timestamps null: false
    end
    reversible do |dir|
      dir.up do
        execute("ALTER TABLE students ADD CHECK(receiptdate<expirationdate)")
        execute("ALTER TABLE students ADD CHECK(receiptdate>'2000-01-01')")
      end
    end
  end
end
