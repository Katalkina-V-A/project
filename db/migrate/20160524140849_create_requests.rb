class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :employee, index: true, foreign_key: true, null:false
      t.references :historymove, index: true, foreign_key: true, null: false
      t.text :content
      t.integer :status
      t.date :dateapp
      t.date :dateanswer
      t.text :answer
      t.index [:employee_id, :historymove_id, :dateapp], unique: true, name: :indexapplication

      t.timestamps null: false
    end
    reversible do |dir|
      dir.up do
        execute("ALTER TABLE requests ADD CHECK(dateapp>'2016-01-01')")
        execute("ALTER TABLE requests ADD CHECK(dateanswer>=dateapp)")
      end
    end
  end
end
