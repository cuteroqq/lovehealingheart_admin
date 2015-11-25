class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :cnttype
      t.string :title
      t.text :description
      t.string :author
      t.boolean :is_public
      t.date :public_date
      t.integer :share
      t.integer :like


      t.timestamps null: false
    end
  end
end
