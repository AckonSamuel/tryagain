# frozen_string_literal: true

require 'test_helper'

class StaffsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @staff = staffs(:one)
  end

  test 'should get index' do
    get staffs_url, as: :json
    assert_response :success
  end

  test 'should create staff' do
    assert_difference('Staff.count') do
      post staffs_url,
           params: { staff: { email: @staff.email, name: @staff.name, phone_number: @staff.phone_number } }, as: :json
    end

    assert_response :created
  end

  test 'should show staff' do
    get staff_url(@staff), as: :json
    assert_response :success
  end

  test 'should update staff' do
    patch staff_url(@staff),
          params: { staff: { email: @staff.email, name: @staff.name, phone_number: @staff.phone_number } }, as: :json
    assert_response :success
  end

  test 'should destroy staff' do
    assert_difference('Staff.count', -1) do
      delete staff_url(@staff), as: :json
    end

    assert_response :no_content
  end
end
