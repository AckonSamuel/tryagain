require "test_helper"

class ExecutivesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @executive = executives(:one)
  end

  test "should get index" do
    get executives_url, as: :json
    assert_response :success
  end

  test "should create executive" do
    assert_difference("Executive.count") do
      post executives_url, params: { executive: { club_student_id: @executive.club_student_id, portfolio: @executive.portfolio } }, as: :json
    end

    assert_response :created
  end

  test "should show executive" do
    get executive_url(@executive), as: :json
    assert_response :success
  end

  test "should update executive" do
    patch executive_url(@executive), params: { executive: { club_student_id: @executive.club_student_id, portfolio: @executive.portfolio } }, as: :json
    assert_response :success
  end

  test "should destroy executive" do
    assert_difference("Executive.count", -1) do
      delete executive_url(@executive), as: :json
    end

    assert_response :no_content
  end
end
