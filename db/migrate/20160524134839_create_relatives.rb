class CreateRelatives < ActiveRecord::Migration
  def change
    create_table :relatives do |t|
      t.references :person, index: true, foreign_key: true, null: false
      t.references :kin, polymorphic: true, index: true, null: false
      t.string :relationship

      t.timestamps null: false
    end
  end
end
