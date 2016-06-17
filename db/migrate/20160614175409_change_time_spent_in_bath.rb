class ChangeTimeSpentInBath < ActiveRecord::Migration
  def change
    remove_column :baths, :time_spent
    add_column :baths, :time_spent, :decimal, precision: 8, scale: 2, default: 0
  end
end
