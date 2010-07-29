class SetupDefaultUserForUsers < ActiveRecord::Migration
  def self.up
    user = User.new
    user.name = 'admin'
    user.password = 'password'
    user.save
  end

  def self.down
  end
end
