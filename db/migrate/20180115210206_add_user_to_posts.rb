class AddUserToPosts < ActiveRecord::Migration[5.1]
  def self.up
    add_reference :posts, :user, foreign_key: true
  end
  def self.down
    remove_reference :posts, :user, foreign_key: true
  end
end
