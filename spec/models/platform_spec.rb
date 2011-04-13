require File.dirname(__FILE__) + '/../spec_helper'

describe Platform do
  it "should be valid" do
    Platform.new.should be_valid
  end
end
