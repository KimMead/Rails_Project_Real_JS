class CreateAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |t|
      t.string :name
      t.text :comment
      t.string :location

      t.timestamps
    end
  end
end
