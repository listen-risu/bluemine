class AddReferenceToUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :project, foreign_key: true
  end
end
