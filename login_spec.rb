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
  it 'should should login rc client using fix account' do
    @driver=Appium::Driver.new(desired_caps).start_driver
    @auto=Auto.new(@driver)
    @page=Page.new(@driver)
    @report=Report.new(REPORT_PATH)
    currentPage=@page.whichPage()

    @report.log('start test',$succeed)
    if currentPage==$LoginSucceed
      @report.log('already login to rc app',$succeed)
    elsif currentPage==$LoginAgree1
      @report.log('rc app encryption agree screen 1',$succeed)
      @auto.clickbutton('com.ringcentral.android:id/btnStart')
      @report.log('rc app encryption agree screen 2',$succeed)
      @auto.clickbutton('com.ringcentral.android:id/btnOk')
    elsif currentPage==$LoginUserPass
      @report.log('need input login username and password',$succeed)
      @auto.sendkeys('com.ringcentral.android:id/phone','8772010001')
      @auto.sendkeys('com.ringcentral.android:id/password','Test!123')
      @auto.clickbutton('com.ringcentral.android:id/btnSignIn')
    end
  end

  after(:each) do
    @report.log('quit driver',$succeed)
    @report.renderall()
    @driver.quit()
  end

end
