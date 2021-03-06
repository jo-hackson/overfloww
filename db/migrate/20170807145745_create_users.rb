class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :username, :null => false
      # t.string :password_hash, :null => false
      # present in devise model
      # t.string :email, :null => false
      t.text :about_me

      t.timestamps
    end
  end
end
