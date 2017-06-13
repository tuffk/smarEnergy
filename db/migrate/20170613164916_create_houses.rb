class CreateHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |t|
      t.belongs_to :user
      t.string :address
      t.string :name
      t.string :area
      t.integer :rooms
      t.timestamps
    end
  end
end
