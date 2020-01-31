require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  test "should not save Question without user" do
    question = Question.new
    assert !question.save
  end
end
