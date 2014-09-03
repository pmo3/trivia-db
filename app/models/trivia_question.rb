class TriviaQuestion < ActiveRecord::Base
  validates_presence_of :category, :question, :right_answer, :wrong_one, :wrong_two, :wrong_three
  validates_uniqueness_of :question
end
