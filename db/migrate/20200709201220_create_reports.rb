class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.references :incident, null: false, foreign_key: true
      t.date :date
      t.boolean :active
      t.string :source

      t.timestamps
    end
  end
end
