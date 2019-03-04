class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.boolean :logged_in, default: false

      t.timestamps
    end
  end
end
