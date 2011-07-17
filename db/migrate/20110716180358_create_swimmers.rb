class CreateSwimmers < ActiveRecord::Migration
  def self.up
    create_table :swimmers do |t|
      t.string :name
      t.string :secname
      t.string :gen
      t.boolean :paid
      t.string :email
      t.integer :phone
      t.string :dni
      t.string :club
      t.string :fed
      t.integer :year
      t.string :pob
      t.string :postal
      t.string :prov
      t.string :dir
      t.integer :prueba
      t.string :cat

      t.timestamps
    end
  end

  def self.down
    drop_table :swimmers
  end
end
