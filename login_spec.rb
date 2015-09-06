require 'rspec'
require 'rubygems'
require 'appium_lib'
require 'debugger'
require './auto.rb'

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
    if @auto.rc_find_element_by_id('com.ringcentral.android:id/btn_main_menu_action_menu')
      p 'already log in do nothing'
    end
    if @auto.rc_find_element_by_id('com.ringcentral.android:id/btnStart')
      p 'encryption start button need click'
      @auto.clickbutton('com.ringcentral.android:id/btnStart')
    end
    if @auto.rc_find_element_by_id('com.ringcentral.android:id/btnOk')
      p 'encryption second screen'
      @auto.clickbutton('com.ringcentral.android:id/btnOk')
    else
      @auto.sendkeys('com.ringcentral.android:id/phone','8772010001')
      @auto.sendkeys('com.ringcentral.android:id/password','Test!123')
      @auto.clickbutton('com.ringcentral.android:id/btnSignIn')
    end
    debugger
  end

  after(:each) do
    debugger
    p 'quit driver'
    @driver.quit()
  end
  
end
