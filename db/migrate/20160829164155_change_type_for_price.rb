class ChangeTypeForPrice < ActiveRecord::Migration

  def self.up
     change_table :items do |t|
       t.change :price, :decimal, :precision => 4
     end
   end
   def self.down
     change_table :items do |t|
       t.change :price, :decimal, :precision => 4, :scale => 2
     end
   end
end
