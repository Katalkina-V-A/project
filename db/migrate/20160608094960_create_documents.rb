class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.attachment :doc
      t.string :title
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
