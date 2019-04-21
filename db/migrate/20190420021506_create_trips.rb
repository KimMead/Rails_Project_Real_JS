class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.integer :user_id 
      t.integer :attraction_id 
      t.integer :rating 
      t.text :comment  

      t.timestamps null:false 
    end
  end
end