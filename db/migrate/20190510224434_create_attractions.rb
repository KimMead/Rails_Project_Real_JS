class CreateAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |t|
      t.string :name
      t.text :comment
      t.string :location
      t.integer :state_id 
      t.integer :user_id

      t.timestamps
    end
  end
end
