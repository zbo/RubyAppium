require 'debugger'

class Auto
  def initialize(driver)
    @driver=driver
  end

  def rc_find_element_by_id(id)
    #debugger
    begin
      ob=@driver.find_element(:id,id)
      return true
    rescue => err
      return false
    end
  end

  def sendkeys(id,keys)
    textbox=@driver.find_element(:id, id)
    textbox.send_keys(keys)
  end

  def clickbutton(id)
    loginbutton=@driver.find_element(:id, id)
    loginbutton.click()
  end
end
