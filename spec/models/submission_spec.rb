require File.dirname(__FILE__) + '/../spec_helper'

describe Submission do
  it "should be valid" do
    Submission.new.should be_valid
  end
end
