require 'debugger'
require 'test/unit'
require './report.rb'

class Report_Generation < Test::Unit::TestCase
  REPORT_PATH='/Users/bob.zhu/project/rb/login/report/'
  def setup
    @report=Report.new(REPORT_PATH)
  end
  def test_generate
    @report.log('start test',$succeed)
    @report.log('step 1',$succeed)
    @report.log('step 2',$succeed)
    @report.log('step 3',$failed)
    all=@report.renderall('test_report_generation')
    assert_equal(4,all.size)
  end
end
