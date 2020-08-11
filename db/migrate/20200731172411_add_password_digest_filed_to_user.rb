# class to create a new table attendances
class AddPasswordDigestFiledToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :password_digest, :string
  end
end
