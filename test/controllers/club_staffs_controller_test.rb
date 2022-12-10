# frozen_string_literal: true

require 'test_helper'

class ClubStaffsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @club_staff = club_staffs(:one)
  end

  test 'should get index' do
    get club_staffs_url, as: :json
    assert_response :success
  end

  test 'should create club_staff' do
    assert_difference('ClubStaff.count') do
      post club_staffs_url, params: { club_staff: { club_id: @club_staff.club_id, staff_id: @club_staff.staff_id } },
                            as: :json
    end

    assert_response :created
  end

  test 'should show club_staff' do
    get club_staff_url(@club_staff), as: :json
    assert_response :success
  end

  test 'should update club_staff' do
    patch club_staff_url(@club_staff),
          params: { club_staff: { club_id: @club_staff.club_id, staff_id: @club_staff.staff_id } }, as: :json
    assert_response :success
  end

  test 'should destroy club_staff' do
    assert_difference('ClubStaff.count', -1) do
      delete club_staff_url(@club_staff), as: :json
    end

    assert_response :no_content
  end
end
