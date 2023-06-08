class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name,               null: false
      t.string :location,           null: false
      t.datetime :datetime,         null: false
      t.text :description,          null: false
      t.references :user,           null: false, foreign_key: true

      t.timestamps
    end
  end
end
