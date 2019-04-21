class CreateAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |t|
      t.string :name 
      t.integer :state_id 


      t.timestamps null: false 
    end
  end
end
