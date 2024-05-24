class AddTrackerToIssues < ActiveRecord::Migration[7.1]
  def change
    add_column :issues, :tracker, :integer, limit: 1
  end
end
