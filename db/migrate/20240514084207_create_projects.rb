class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :description
      t.string :homepage, limit: 255
      t.integer :is_public, limit: 1
      t.integer :status, limit: 4

      t.timestamps
    end
  end
end
