class Record < ApplicationRecord
  enum category: {outgoings: 1, income: 2}
  validates_presence_of :amount
  validates_presence_of :category
end
