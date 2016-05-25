class CreateWorkmen < ActiveRecord::Migration
  def change
    create_table :workmen do |t|
      t.references :person, index: true, foreign_key: true, null: false, unique: true
      t.string :placejob
      t.string :post
      t.string :phone

      t.timestamps null: false
    end
  end
end
