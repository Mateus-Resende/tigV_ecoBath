class AddIndexOnEmailToUsers < ActiveRecord::Migration
  def change
    add_index "users", ["email"], name: "index_on_user_email", unique: true, using: :btree
  end
end
