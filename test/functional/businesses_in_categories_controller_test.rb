require 'test_helper'

class BusinessesInCategoriesControllerTest < ActionController::TestCase
  setup do
    @businesses_in_category = businesses_in_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:businesses_in_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create businesses_in_category" do
    assert_difference('BusinessesInCategory.count') do
      post :create, businesses_in_category: @businesses_in_category.attributes
    end

    assert_redirected_to businesses_in_category_path(assigns(:businesses_in_category))
  end

  test "should show businesses_in_category" do
    get :show, id: @businesses_in_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @businesses_in_category
    assert_response :success
  end

  test "should update businesses_in_category" do
    put :update, id: @businesses_in_category, businesses_in_category: @businesses_in_category.attributes
    assert_redirected_to businesses_in_category_path(assigns(:businesses_in_category))
  end

  test "should destroy businesses_in_category" do
    assert_difference('BusinessesInCategory.count', -1) do
      delete :destroy, id: @businesses_in_category
    end

    assert_redirected_to businesses_in_categories_path
  end
end
