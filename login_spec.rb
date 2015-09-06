require 'rspec'
require 'rubygems'
require 'appium_lib'
require 'debugger'
require './auto.rb'
require './page.rb'

APP_PATH = '/Users/bob.zhu/project/rb/RBTests/RCMobile_7.4.0.1.95_Production.apk'

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
    debugger
    @page=Page.new(@driver)
    currentPage=@page.whichPage()

    if currentPage==$LoginSucceed
      p 'already log in do nothing'
    elsif currentPage==$LoginAgree1
      p 'encryption start button need click'
      @auto.clickbutton('com.ringcentral.android:id/btnStart')
      p 'encryption second screen'
      @auto.clickbutton('com.ringcentral.android:id/btnOk')
    elsif currentPage==$LoginUserPass
      p 'need input login username and password'
      @auto.sendkeys('com.ringcentral.android:id/phone','8772010001')
      @auto.sendkeys('com.ringcentral.android:id/password','Test!123')
      @auto.clickbutton('com.ringcentral.android:id/btnSignIn')
    end
  end

  after(:each) do
    p 'quit driver'
    @driver.quit()
  end

end
