require File.dirname(__FILE__) + '/../spec_helper'

describe Plattform do
  it "should be valid" do
    Plattform.new.should be_valid
  end
end
