require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  setup do
    @status = statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statuses)
  end

  test "deber ser redirigido cuando no ha iniciado sesion" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "deberia mostrar la nueva pagina cuando inicio sesion" do
    sign_in users (:juanso)
    get :new
    assert_response :success
  end

  test "debe iniciar sesion para hacer un post" do
    post :create, status: { contenido: "Hola mundo" }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create status" do
    sign_in users (:juanso)
    assert_difference('Status.count') do
    post :create, status: { contenido: @status.contenido }
  end

    assert_redirected_to status_path(assigns(:status))
  end

  test "should show status" do
    get :show, id: @status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @status
    assert_response :success
  end

  test "should update status" do
    patch :update, id: @status, status: { contenido: @status.contenido }
    assert_redirected_to status_path(assigns(:status))
  end

  test "should destroy status" do
    assert_difference('Status.count', -1) do
      delete :destroy, id: @status
    end

    assert_redirected_to statuses_path
  end
end
