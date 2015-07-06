class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :admin
      t.string :email
      t.string :password_hash
      t.string :password_salt

      t.timestamps

    end
  end
end
