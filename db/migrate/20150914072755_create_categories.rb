class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :cname
      t.boolean :status

      t.timestamps null: false
    end
  end
end
