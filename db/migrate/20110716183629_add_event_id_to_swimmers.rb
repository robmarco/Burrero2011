class AddEventIdToSwimmers < ActiveRecord::Migration
  def self.up
    add_column :swimmers, :event_id, :integer
  end

  def self.down
    remove_column :swimmers, :event_id
  end
end
