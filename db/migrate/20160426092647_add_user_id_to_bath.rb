class AddUserIdToBath < ActiveRecord::Migration
  def change
    add_column :baths, :user_id, :integer
  end
end
