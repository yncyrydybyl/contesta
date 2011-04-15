require 'spec_helper'
require 'database_cleaner'

describe PagesController do

  describe 'with unauthorized users' do

    before :each do
      @page = stub_model(Page)
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

  end

  describe 'logged in admin user' do
    before :each do
      @admin = Factory.create(:admin)
      @submission = Factory.create(:submission)
      sign_in @admin
    end

    after :each do
      DatabaseCleaner.clean
    end

    describe 'new' do
      it 'should allow bulding pages' do
        Page.should_receive(:new).at_least(:once)
        get :new
        response.should be_ok
      end

      it 'should assign the page instance variable' do
        Page.stub(:new => 'new_page')
        get :new

        assigns[:page].should == 'new_page'
      end

      it 'should assign serialize pages xml on request' do
        Page.stub(:new => [])
        get :new, :format => :xml

        response.should be_ok
        response.body.should == [].to_xml
        response.content_type.should == 'application/xml'
      end
    end
  end

end
