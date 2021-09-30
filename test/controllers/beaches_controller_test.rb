require "test_helper"

class BeachesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @beach = beaches(:one)
  end

  test "should get index" do
    get beaches_url, as: :json
    assert_response :success
  end

  test "should create beach" do
    assert_difference('Beach.count') do
      post beaches_url, params: { beach: { address: @beach.address, city: @beach.city, country: @beach.country, details: @beach.details, image: @beach.image, name: @beach.name, rating: @beach.rating } }, as: :json
    end

    assert_response 201
  end

  test "should show beach" do
    get beach_url(@beach), as: :json
    assert_response :success
  end

  test "should update beach" do
    patch beach_url(@beach), params: { beach: { address: @beach.address, city: @beach.city, country: @beach.country, details: @beach.details, image: @beach.image, name: @beach.name, rating: @beach.rating } }, as: :json
    assert_response 200
  end

  test "should destroy beach" do
    assert_difference('Beach.count', -1) do
      delete beach_url(@beach), as: :json
    end

    assert_response 204
  end
end
