require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  setup do
    @line_item = line_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_item" do
    assert_difference('LineItem.count') do
      post :create, :product_id => products(:ruby).id
    end

    assert_redirected_to store_path
  end

  test "should create line_item via ajax" do

    #xhr stands for XMLHttpRequest
    #Decent info on XHR http://www.allinterview.com/showanswers/70920.html
    #basically xhr is a request made by javascript / ajax. The controller can handle these differently
    #Adding :remote => true to a button_to in a .html.erb is making the request to the server a javascript request

    #there is no redirect in this test case cuz we are using ajax to just update the page.

    assert_difference('LineItem.count') do
      xhr :post, :create, :product_id => products(:ruby).id
    end

    assert_response :success

    assert_select_rjs :replace_html, 'cart' do
      assert_select 'tr#current_item td', /Programming Ruby/
    end
  end

  test "should show line_item" do
    get :show, :id => @line_item.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @line_item.to_param
    assert_response :success
  end

  test "should update line_item" do
    put :update, :id => @line_item.to_param, :line_item => @line_item.attributes
    assert_redirected_to line_item_path(assigns(:line_item))
  end

  test "should destroy line_item" do
    assert_difference('LineItem.count', -1) do
      delete :destroy, :id => line_items(:working).to_param
    end

    assert_redirected_to store_path
  end
end
