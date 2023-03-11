require "test_helper"

class Api::V1::GreetingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @greeting = greetings(:one)
  end

  test "should get index" do
    get api_v1_greetings_url, as: :json
    assert_response :success
  end

  test "should create greeting" do
    assert_difference("Greeting.count") do
      post api_v1_greetings_url, params: { greeting: { text: @greeting.text } }, as: :json
    end

    assert_response :created
  end

  test "should show greeting" do
    get api_v1_greeting_url(@greeting), as: :json
    assert_response :success
  end

  test "should update greeting" do
    patch api_v1_greeting_url(@greeting), params: { greeting: { text: @greeting.text } }, as: :json
    assert_response :success
  end

  test "should destroy greeting" do
    assert_difference("Greeting.count", -1) do
      delete api_v1_greeting_url(@greeting), as: :json
    end

    assert_response :no_content
  end
end
