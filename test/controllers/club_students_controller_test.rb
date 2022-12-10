# frozen_string_literal: true

require 'test_helper'

class ClubStudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @club_student = club_students(:one)
  end

  test 'should get index' do
    get club_students_url, as: :json
    assert_response :success
  end

  test 'should create club_student' do
    assert_difference('ClubStudent.count') do
      post club_students_url,
           params: { club_student: { club_id: @club_student.club_id, student_id: @club_student.student_id } }, as: :json
    end

    assert_response :created
  end

  test 'should show club_student' do
    get club_student_url(@club_student), as: :json
    assert_response :success
  end

  test 'should update club_student' do
    patch club_student_url(@club_student),
          params: { club_student: { club_id: @club_student.club_id, student_id: @club_student.student_id } }, as: :json
    assert_response :success
  end

  test 'should destroy club_student' do
    assert_difference('ClubStudent.count', -1) do
      delete club_student_url(@club_student), as: :json
    end

    assert_response :no_content
  end
end
