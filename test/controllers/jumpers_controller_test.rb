require 'test_helper'

class JumpersControllerTest < ActionController::TestCase
  setup do
    @jumper = jumpers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jumpers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jumper" do
    assert_difference('Jumper.count') do
      post :create, jumper: { club: @jumper.club, description: @jumper.description, email: @jumper.email, license: @jumper.license, license: @jumper.license, name: @jumper.name, nextofkin: @jumper.nextofkin, phone: @jumper.phone, rating: @jumper.rating, verified: @jumper.verified }
    end

    assert_redirected_to jumper_path(assigns(:jumper))
  end

  test "should show jumper" do
    get :show, id: @jumper
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jumper
    assert_response :success
  end

  test "should update jumper" do
    patch :update, id: @jumper, jumper: { club: @jumper.club, description: @jumper.description, email: @jumper.email, license: @jumper.license, license: @jumper.license, name: @jumper.name, nextofkin: @jumper.nextofkin, phone: @jumper.phone, rating: @jumper.rating, verified: @jumper.verified }
    assert_redirected_to jumper_path(assigns(:jumper))
  end

  test "should destroy jumper" do
    assert_difference('Jumper.count', -1) do
      delete :destroy, id: @jumper
    end

    assert_redirected_to jumpers_path
  end
end
