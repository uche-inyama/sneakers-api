class DropTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :users
  end

  def down
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.string :password_confirmation, null: false

      t.timestamps
    end
  end
end
