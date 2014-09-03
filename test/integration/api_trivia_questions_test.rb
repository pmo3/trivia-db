require 'test_helper'

class ApiTriviaQuestionsTest < ActionDispatch::IntegrationTest
  test "get /api/triviaquestions.json" do
    get "/api/triviaquestions.json"
    assert_response :success
    assert body == TriviaQuestion.all.to_json
    triviaquestions = JSON.parse(response.body)
    assert triviaquestions.size == 3
    assert triviaquestions.any? { |q| q["question"] == "What is Katy Perrys first name?"}
  end

  test "get /api/triviaquestions/:id" do
    triviaquestion = trivia_questions(:katy_perry_name)
    get "/api/triviaquestions/#{triviaquestion.id}.json"
    assert_response :success
    assert body == triviaquestion.to_json
    assert JSON.parse(response.body)["question"] = triviaquestion.question
  end

  test "get /api/triviaquestions/by_category/:category" do
    triviaquestion = trivia_questions(:three)
    get "/api/triviaquestions/by_category/Sports.json"
    assert_response :success
    #since this get request returns an array, tests require some finagling
    # to make sure we're returning the right object
    assert body.gsub!("[", "").gsub!("]", "") == triviaquestion.to_json
    assert JSON.parse(response.body)[0]["question"] = triviaquestion.question
  end
end