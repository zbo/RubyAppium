require 'debugger'
require 'test/unit'
require File.expand_path('../report', __FILE__)

class Take_Screencut < Test::Unit::TestCase
  REPORT_PATH='/Users/bob.zhu/project/rb/login/report/'
  def setup
    @report=Report.new(REPORT_PATH)
  end
  def test_screencut
    file=@report.screencut()
    assert_not_nil(file)
  end
end
