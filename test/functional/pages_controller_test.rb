require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Pages.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Pages.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Pages.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to pages_url(assigns(:pages))
  end
  
  def test_edit
    get :edit, :id => Pages.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Pages.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Pages.first
    assert_template 'edit'
  end

  def test_update_valid
    Pages.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Pages.first
    assert_redirected_to pages_url(assigns(:pages))
  end
  
  def test_destroy
    pages = Pages.first
    delete :destroy, :id => pages
    assert_redirected_to pages_url
    assert !Pages.exists?(pages.id)
  end
end
