class CreateCaptures < ActiveRecord::Migration[5.1]
  def change
    create_table :captures do |t|
      t.belongs_to :device
      t.datetime :start
      t.datetime :stop
      t.decimal :amount
      t.timestamps
    end
  end
end
