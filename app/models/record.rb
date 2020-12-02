class Record < ApplicationRecord
  validates_presence_of :amount
  validates_presence_of :category
end
