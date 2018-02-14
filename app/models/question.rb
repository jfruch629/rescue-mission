class Question < ApplicationRecord
  has_many :answers

  validates :title, presence: true
  validates :description, presence: true
  validates :title, length: { minimum: 20 }
  validates :description, length:{ minimum: 50 }
  accepts_nested_attributes_for :answers, allow_destroy: true
end
