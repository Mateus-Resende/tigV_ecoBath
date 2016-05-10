class CreateBaths < ActiveRecord::Migration
  def change
    create_table :baths do |t|
      t.float     'amount_spent'
      t.date      'date'
      t.float     'ideal_amount'
      t.datetime  'time_spent'
      t.integer   'user_id'
    end
  end
end
