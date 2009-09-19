class CreateBeverages < ActiveRecord::Migration
  def self.up
    create_table :beverages do |t|
      t.belongs_to    :beverage_type
      t.string        :name
      t.boolean       :alcoholic
      t.boolean       :carbonated
      t.text          :description
      t.timestamps
    end
  end

  def self.down
    drop_table :beverages
  end
end
