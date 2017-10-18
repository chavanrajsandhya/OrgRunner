class CreateDrivers < ActiveRecord::Migration[5.0]
  def change
    create_table :drivers do |t|
    	t.string :name
    	t.text :address
    	t.integer :mobile_number
    	t.string :licence
    	t.string :cab_number
      t.timestamps
    end
  end
end
