class AddPublicKeyIndexToUser < ActiveRecord::Migration
  def self.up
    add_index :users, :public_key
  end

  def self.down
  end
end
