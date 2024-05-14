class CreateIssues < ActiveRecord::Migration[7.1]
  def change
    create_table :issues do |t|
      t.string :title
      t.text :description
      t.integer :status
      t.integer :category
      t.integer :version
      t.json :files
      t.json :watcher
      t.datetime :start_at
      t.datetime :end_at
      t.integer :estimated_man_month
      t.integer :progress_rate

      t.timestamps
    end
  end
end
