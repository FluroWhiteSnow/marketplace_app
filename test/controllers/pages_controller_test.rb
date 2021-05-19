require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get restricted" do
    get pages_restricted_url
    assert_response :success
  end

  test "should get about" do
    get pages_about_url
    assert_response :success
  end

  test "should get buy" do
    get pages_buy_url
    assert_response :success
  end

  test "should get sell" do
    get pages_sell_url
    assert_response :success
  end
end
