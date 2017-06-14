class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|
      t.belongs_to :house
      t.string :area
      t.string :brand
      t.string :job
      t.integer :resource_type
      t.timestamps
    end
  end
end
