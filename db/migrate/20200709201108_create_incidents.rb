class CreateIncidents < ActiveRecord::Migration[6.0]
  def change
    create_table :incidents do |t|
      t.date :date
      t.string :city
      t.string :state
      t.float :lat
      t.float :long
      t.boolean :active
      t.boolean :cop

      t.timestamps
    end
  end
end
