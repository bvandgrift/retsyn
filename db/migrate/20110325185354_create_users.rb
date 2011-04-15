class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name, :null => false
      t.string :public_key, :limit => 1024, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
