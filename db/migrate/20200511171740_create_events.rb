class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :price
      t.string :location
      t.string :title
      t.text :description
      t.integer :duration
      t.datetime :start_date
      t.references :admin , index:true

      t.timestamps
    end
  end
  
end
