class Comment < ApplicationRecord
  enum comment_type: %i[on_question on_comment]
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :discussions, as: :commentable, class_name: 'Comment'

  validates_presence_of :description
end
