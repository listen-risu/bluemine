class AddReferenceToIssues < ActiveRecord::Migration[7.1]
  def change
    add_reference :issues, :project, null: false, foreign_key: true
    add_reference :issues, :user, null: false, foreign_key: true
  end
end
