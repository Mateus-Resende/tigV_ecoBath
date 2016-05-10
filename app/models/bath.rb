class Bath < ActiveRecord::Base
  # t.float    "amount_spent"
  # t.date     "date"
  # t.float    "ideal_amount"
  # t.datetime "time_spent"

  belongs_to :user

  # banho não pode ser salvo sem algum desses atributos
  validates_presence_of :date
  validates_presence_of :amount_spent
  validates_presence_of :time_spent

  # cálculo da quantidade ideal de água gasta com os atributos fornecidos
  after_save :calculate_ideal_amount

  def calculate_ideal_amount
    self.ideal_amount = ((time_spent.min * 60) + time_spent.sec) * 0.15
  end
end
