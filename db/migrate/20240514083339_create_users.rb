class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :otp_secret
      t.integer :last_otp_at

      t.timestamps
    end
  end
end
