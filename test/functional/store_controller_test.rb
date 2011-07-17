require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index

    # Key:
    # # matches id attributes
    # . matches class attributes
    # no prefix matches element name

    assert_response :success
    assert_select '#columns #side a', :minimum => 4 #verifies min 4 elements <a> inside id=side that's inside id=columns
    assert_select '#main .entry', 3                 #verifies there are 3 elements with class = entry, inside id=main
    assert_select 'h3', 'Programming Ruby'          #verifies that there is an h3 element with the title 'Program...'
    assert_select '.price', /\$[,\d]+\.\d\d/
  end

end
