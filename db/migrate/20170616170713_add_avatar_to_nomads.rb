class AddAvatarToNomads < ActiveRecord::Migration
  def self.up
    add_attachment :nomads, :avatar
  end

  def self.down
    remove_attachment :nomads, :avatar
  end
end