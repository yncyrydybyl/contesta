require File.dirname(__FILE__) + '/../spec_helper'

describe Submission do
  it "should be valid" do
    Submission.new.should be_valid
  end
  it "should be invalid to have a loooong title" do
    Submission.create(:title => "looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo").should be_invalid
  end
end
