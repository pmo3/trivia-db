class CreateTriviaQuestions < ActiveRecord::Migration
  def change
    create_table :trivia_questions do |t|
      t.string :category
      t.text :question
      t.string :right_answer
      t.string :wrong_one
      t.string :wrong_two
      t.string :wrong_three

      t.timestamps
    end
  end
end
