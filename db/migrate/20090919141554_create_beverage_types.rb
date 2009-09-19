class CreateBeverageTypes < ActiveRecord::Migration
  def self.up
    create_table :beverage_types do |t|
      t.string        :name
      t.timestamps
    end
  end

  def self.down
    drop_table :beverage_types
  end
end
