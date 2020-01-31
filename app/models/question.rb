class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, as: :commentable, class_name: 'Comment'

  validates_presence_of :question_name
end