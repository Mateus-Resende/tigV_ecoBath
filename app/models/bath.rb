class Bath < ActiveRecord::Base
  # t.float    "amount_spent"
  # t.date     "date"
  # t.float    "ideal_amount"
  # t.datetime "time_spent"

  belongs_to :user

  # banho não pode ser salvo sem algum desses atributos
  # validates_presence_of :date
  # validates_presence_of :amount_spent
  # validates_presence_of :time_spent

end
