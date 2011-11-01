require 'spec_helper'
require 'database_cleaner'

describe PagesController do

  describe 'with unauthorized users' do

    before :each do
      #Page.any_@page = stub_model(Page)
    end

    after :each do
      DatabaseCleaner.clean
    end

    describe 'new' do
      it 'should redirect unauthorized users' do
        get :new
        response.status.should == 302
        response.should redirect_to root_url
      end
    end
    describe 'create' do
      it 'should redirect unauthorized users' do
      post :create
      response.status.should == 302
      response.should redirect_to root_url
      end
    end
  end

  describe 'logged in admin user' do
    before(:suite) do
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with(:truncation)
    end
    before :each do
      DatabaseCleaner.start
      @admin = Factory.create(:admin)
      sign_in @admin
    end

    after :each do
      DatabaseCleaner.clean
    end

    describe 'new' do
      it 'should allow bulding pages' do
        #Page = mock
        # the following line somehow broke factory_girl i.e
        # stubbed :new with []
        #Page.expects(:new).at_least_once
        get :new
        assigns(:page).should be_a_new(Page)
        response.should be_ok
      end

      it 'should assign the page instance variable' do
        # Page = mock
        # Page.stubs(:new => [])
        get :new, :format => :xml

        assigns(:page).should be_a_new(Page)
        response.should be_ok
        # Why should we test something we just stubbed with []?
        # response.body.should == [].to_xml
        response.content_type.should == 'application/xml'
      end
    end

    describe 'create' do
      it 'should create a new Page and show it' do
        @page = Factory.build(:page)
        post :create, :page => @page
        response.should be_redirect
        response.should redirect_to :action => :show, :id => Page.last.id
      end
    end
    describe 'show' do
      it 'should return a Page by permalink' do
        @page = Factory.create(:page, :permalink => "slug")
        get :show, :permalink => "slug"
        response.should be_ok
      end
    end
  end

end
