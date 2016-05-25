require 'test_helper'

class LinensControllerTest < ActionController::TestCase
  setup do
    @linen = linens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:linens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create linen" do
    assert_difference('Linen.count') do
      post :create, linen: { note: @linen.note, quantity: @linen.quantity, size: @linen.size, title: @linen.title }
    end

    assert_redirected_to linen_path(assigns(:linen))
  end

  test "should show linen" do
    get :show, id: @linen
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @linen
    assert_response :success
  end

  test "should update linen" do
    patch :update, id: @linen, linen: { note: @linen.note, quantity: @linen.quantity, size: @linen.size, title: @linen.title }
    assert_redirected_to linen_path(assigns(:linen))
  end

  test "should destroy linen" do
    assert_difference('Linen.count', -1) do
      delete :destroy, id: @linen
    end

    assert_redirected_to linens_path
  end
end
