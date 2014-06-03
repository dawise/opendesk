class AddImageToPost < ActiveRecord::Migration
  def self.up
    change_table :post do |t|
    add_attachment :posts, :image
  end

  def self.down
    remove_attachment :posts, :image
  end
end
