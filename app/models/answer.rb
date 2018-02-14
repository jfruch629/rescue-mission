class Answer < ApplicationRecord
  belongs_to :question

  validates :content, length:{ minimum: 50 }
end
