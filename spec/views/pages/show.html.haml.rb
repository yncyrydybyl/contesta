require "spec_helper"
describe "pages/show.html.haml" do

  before(:each) do
    assign(:page, stub_model(Page, :content => "* eins\n * zwei\n", :id => 120))
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    controller.stub(:current_ability) { @ability }
    @admin = Factory.create(:admin)
  end

  context "any user" do
    it "can see the rendered html content" do
      @ability.can :read, Page
      render
      rendered.should have_selector(:li, :content => "eins")
      rendered.should have_selector(:li, :content => "zwei")
    end
  end
  context "admin user" do
    it "can see admin navigation" do
      @ability.can :manage, Page
      render
      rendered.should have_selector(:a, :href => "/pages/120/edit")
    end
  end
end
