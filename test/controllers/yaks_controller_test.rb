require 'test_helper'

class YaksControllerTest < ActionController::TestCase
  setup do
    @yak = yaks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:yaks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create yak" do
    assert_difference('Yak.count') do
      post :create, yak: { body: @yak.body, score: @yak.score }
    end

    assert_redirected_to yak_path(assigns(:yak))
  end

  test "should show yak" do
    get :show, id: @yak
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @yak
    assert_response :success
  end

  test "should update yak" do
    patch :update, id: @yak, yak: { body: @yak.body, score: @yak.score }
    assert_redirected_to yak_path(assigns(:yak))
  end

  test "should destroy yak" do
    assert_difference('Yak.count', -1) do
      delete :destroy, id: @yak
    end

    assert_redirected_to yaks_path
  end
end
