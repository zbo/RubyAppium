require 'debugger'
require 'test/unit'
require File.expand_path('../gen', __FILE__)

class Gen_Clean < Test::Unit::TestCase
  def test_clean_all
    gen=Gen.new()
    gen.clean_all()
    assert_equal([".", ".."], Dir.entries(gen.work_space))
  end
end
