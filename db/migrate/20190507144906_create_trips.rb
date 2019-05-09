class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.integer :user_id
      t.integer :state_id 
      t.string :attraction

      t.timestamps
    end
  end
end
