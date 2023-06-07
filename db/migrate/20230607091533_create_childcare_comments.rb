class CreateChildcareComments < ActiveRecord::Migration[6.0]
  def change
    create_table :childcare_comments do |t|
      t.text :content,         null: false
      t.references :childcare, null: false, foreign_key: true 
      t.references :user,      null: false, foreign_key: true

      t.timestamps
    end
  end
end
