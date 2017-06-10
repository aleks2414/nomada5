require 'test_helper'

class ExperiencesControllerTest < ActionController::TestCase
  setup do
    @experience = experiences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:experiences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create experience" do
    assert_difference('Experience.count') do
      post :create, experience: { advice: @experience.advice, aprox_time: @experience.aprox_time, currency: @experience.currency, description: @experience.description, expe: @experience.expe, gente: @experience.gente, gusto: @experience.gusto, gusto: @experience.gusto, idioma: @experience.idioma, is_internet: @experience.is_internet, is_reservation: @experience.is_reservation, is_risky: @experience.is_risky, latitude: @experience.latitude, longitude: @experience.longitude, money: @experience.money, nomad_id: @experience.nomad_id, oido: @experience.oido, olfato: @experience.olfato, title: @experience.title, vista: @experience.vista, website: @experience.website }
    end

    assert_redirected_to experience_path(assigns(:experience))
  end

  test "should show experience" do
    get :show, id: @experience
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @experience
    assert_response :success
  end

  test "should update experience" do
    patch :update, id: @experience, experience: { advice: @experience.advice, aprox_time: @experience.aprox_time, currency: @experience.currency, description: @experience.description, expe: @experience.expe, gente: @experience.gente, gusto: @experience.gusto, gusto: @experience.gusto, idioma: @experience.idioma, is_internet: @experience.is_internet, is_reservation: @experience.is_reservation, is_risky: @experience.is_risky, latitude: @experience.latitude, longitude: @experience.longitude, money: @experience.money, nomad_id: @experience.nomad_id, oido: @experience.oido, olfato: @experience.olfato, title: @experience.title, vista: @experience.vista, website: @experience.website }
    assert_redirected_to experience_path(assigns(:experience))
  end

  test "should destroy experience" do
    assert_difference('Experience.count', -1) do
      delete :destroy, id: @experience
    end

    assert_redirected_to experiences_path
  end
end
