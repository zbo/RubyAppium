require 'rspec'
require 'rubygems'
require 'appium_lib'
require 'debugger'
require './auto.rb'
require './page.rb'
require './report.rb'

APP_PATH = '/Users/bob.zhu/project/rb/RBTests/RCMobile_7.4.0.1.95_Production.apk'
REPORT_PATH = '/Users/bob.zhu/project/rb/login/report/'

desired_caps = {
    caps:       {
        platformName:  'android',
        versionNumber: '4.4',
        deviceName:    'e7029708',
        app:           APP_PATH,
    },
    appium_lib: {
        sauce_username:   nil, # don't run on Sauce
        sauce_access_key: nil
    }
}

describe 'Login' do
  before(:all) do
    @filename=Time.new.strftime("%Y-%m-%d-%H:%M:%S")+'-'+rand(999999).to_s
  end

  before(:each) do
    @driver=Appium::Driver.new(desired_caps).start_driver
    @auto=Auto.new(@driver)
    @page=Page.new(@driver)
    @report=Report.new(REPORT_PATH)
  end

  it 'should should login rc client using fix account' do
    currentPage=@page.whichPage()
    @report.log('start test login',$succeed)
    if currentPage==$LoginUserPass
      @report.logs('need input login username and password',$succeed,$screen_cut_on)
      @auto.sendkeys('com.ringcentral.android:id/phone','8772010001')
      @auto.sendkeys('com.ringcentral.android:id/password','Test!123')
      @report.logs('input username and password finished',$succeed,$screen_cut_on)
      @auto.clickbutton('com.ringcentral.android:id/btnSignIn')
    elsif currentPage==$LoginAgree1
      @report.logs('rc app encryption agree screen 1',$succeed,$screen_cut_on)
      @auto.clickbutton('com.ringcentral.android:id/btnStart')
      @report.logs('rc app encryption agree screen 2',$succeed,$screen_cut_on)
      @auto.clickbutton('com.ringcentral.android:id/btnOk')
    elsif currentPage==$LoginSucceed
      @report.logs('already login to rc app',$succeed,$screen_cut_on)
    end
  end

  it 'should find all main tab buttons' do
    @report.logs('start test main tabs',$succeed,$screen_cut_on)
    all4=@driver.find_elements(:id,'com.ringcentral.android:id/tab_main_text')
    @report.logs('verify main tabs',$succeed,$screen_cut_on)
    all4[0].text.should == 'Messages'
    all4[1].text.should == 'Call Log'
    all4[2].text.should == 'Contacts'
    all4[3].text.should == 'Dial Pad'
  end

  after do
    @report.log('quit driver',$succeed)
    @report.renderall(@filename)
    @driver.quit()
  end

end
