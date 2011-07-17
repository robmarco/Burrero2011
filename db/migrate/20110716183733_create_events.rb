class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.boolean :closed
      t.string :contact_email
      t.integer :contact_phone

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
