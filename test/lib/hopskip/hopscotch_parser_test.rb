require 'test_helper'

class HopscotchParserTest < ActiveSupport::TestCase
  test 'creates a new parser' do
    a = Hopskip::HopscotchParser.new(ApplicationController.new)
    assert_equal a.class, Hopskip::HopscotchParser
  end

  test '#show should return nil if the controller has no tour associated with it' do
    a = Hopskip::HopscotchParser.new(ApplicationController.new)
    assert_nil a.show
  end

  test '#invalid YAML should raise error' do
    assert_raises Hopskip::InvalidYAMLError do
      Hopskip::HopscotchParser.new(FailureController.new)
    end
  end

end
