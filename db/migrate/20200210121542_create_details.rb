class CreateDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :details do |t|
      t.references :favorite, foreign_key: true, null: false

      t.string :name
      t.string :purchase_date
      t.string :place
      t.string :person
      t.string :reason
      t.string :way
    
      t.timestamps
      
    end
  end
end
