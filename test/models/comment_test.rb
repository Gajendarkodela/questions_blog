require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "should not save comment without user or question" do
    comment = Comment.new
    assert !comment.save
  end
end
