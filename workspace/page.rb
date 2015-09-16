require 'debugger'
require './auto.rb'

class Page
  $Unknown='UnKnown'
  $LoginUserPass='LoginUserPass'
  $LoginAgree1='LoginAgree1'
  $LoginAgree2='LoginAgree2'
  $LoginSucceed='LoginSucceed'

  def initialize(driver)
    @driver=driver
  end
  def whichPage
    @auto=Auto.new(@driver)
    if @auto.rc_find_element_by_id('com.ringcentral.android:id/btn_main_menu_action_menu')
      return $LoginSucceed
    elsif @auto.rc_find_element_by_id('com.ringcentral.android:id/btnStart')
      return $LoginAgree1
    elsif @auto.rc_find_element_by_id('com.ringcentral.android:id/phone')
      return $LoginUserPass
    else
      return $Unknown
    end
  end
end
