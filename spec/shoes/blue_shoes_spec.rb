require 'spec_helper'

require 'blue_shoes'

describe Shoes do

  it "should make a class app into an App " do
    Shoes::App.should_receive(:new)
    Shoes.app { }
  end
end
