class MoveAlcoholicToType < ActiveRecord::Migration
  def self.up
    remove_column :beverages, :alcoholic
    add_column :beverage_types, :alcoholic, :boolean
  end

  def self.down
    add_column :beverages, :alcoholic, :boolean
    remove_column :beverage_types, :alcoholic
  end
end
