# frozen_string_literal: true

require 'test_helper'

class PatronsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patron = patrons(:one)
  end

  test 'should get index' do
    get patrons_url, as: :json
    assert_response :success
  end

  test 'should create patron' do
    assert_difference('Patron.count') do
      post patrons_url, params: { patron: { club_staff_id: @patron.club_staff_id } }, as: :json
    end

    assert_response :created
  end

  test 'should show patron' do
    get patron_url(@patron), as: :json
    assert_response :success
  end

  test 'should update patron' do
    patch patron_url(@patron), params: { patron: { club_staff_id: @patron.club_staff_id } }, as: :json
    assert_response :success
  end

  test 'should destroy patron' do
    assert_difference('Patron.count', -1) do
      delete patron_url(@patron), as: :json
    end

    assert_response :no_content
  end
end
