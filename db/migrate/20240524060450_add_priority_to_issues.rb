class AddPriorityToIssues < ActiveRecord::Migration[7.1]
  def change
    add_column :issues, :priority, :integer
  end
end
