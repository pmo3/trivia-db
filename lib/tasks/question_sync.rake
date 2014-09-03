require 'csv'

namespace :question_sync do
  desc 'Import Questions from csv file'
  task :import => :environment do
    CSV.foreach('trivia.csv', :headers => true) do |row|
      TriviaQuestion.create(row.to_hash)
    end
  end
end