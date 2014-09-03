require 'test_helper'

class TriviaQuestionTest < ActiveSupport::TestCase
  setup do
    @triviaquestion_defaults = {
      category: "Pop Culture",
      question: "What is Katyl Perrys first name?",
      right_answer: "Katheryn",
      wrong_one: "Katherine",
      wrong_two: "Kate",
      wrong_three: "Karen",
    }
  end

  test "should be invalid if missing required data" do
    triviaquestion = TriviaQuestion.new
    assert !triviaquestion.valid?
    [:category, :question, :right_answer, :wrong_one, :wrong_two, :wrong_three].each do |field_name|
      assert triviaquestion.errors.keys.include? field_name
    end
  end

  test "should be valid if required data exists" do
    triviaquestion = TriviaQuestion.new(@triviaquestion_defaults)
    assert triviaquestion.valid?
  end

  test "should not allow repeat questions" do
    triviaquestion = TriviaQuestion.new(@triviaquestion_defaults)
    triviaquestion.question = "Katy Perry began her music career in which genre?"
    assert !triviaquestion.valid?
    assert triviaquestion.errors[:question].include? "has already been taken"
  end
end
