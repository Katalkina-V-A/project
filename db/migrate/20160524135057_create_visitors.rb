class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.references :person, index: true, foreign_key: true, null: false
      t.integer :document
      t.string :numb
      t.index [:person_id, :document, :numb], unique: true, name: :indexvisitor
      t.index [:document, :numb], unique: true
      t.timestamps null: false
    end
  end
end
