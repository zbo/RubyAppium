require 'rspec'
require 'rubygems'
require 'appium_lib'
require 'debugger'
require File.expand_path('../auto.rb', __FILE__)
require File.expand_path('../page.rb', __FILE__)
require File.expand_path('../report.rb', __FILE__)

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
