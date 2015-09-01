require 'rspec'
require 'rubygems'
require 'appium_lib'
require 'debugger'
require './login.rb'

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
  it 'should should login rc clinet using fix account' do
    @driver=Appium::Driver.new(desired_caps).start_driver
    if rc_find_element_by_id(@driver,'com.ringcentral.android:id/btn_main_menu_action_menu')
      p 'already log in do nothing'
    end
    if rc_find_element_by_id(@driver,'com.ringcentral.android:id/btnStart')
      debugger
      startbutton=@drivrt.find_element(:id,'com.ringcentral.android:id/btnStart')
      startbutton.click()
    else
      phonebox=@driver.find_element(:id,'com.ringcentral.android:id/phone')
      phonebox.send_keys('8772010001')
      passbox=@driver.find_element(:id,'com.ringcentral.android:id/password')
      passbox.send_keys('Test!123')
      loginbutton=@driver.find_element(:id,'com.ringcentral.android:id/btnSignIn')
      loginbutton.click()
    end
    @driver.quit()
  end
end
