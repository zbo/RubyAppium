require 'debugger'

def rc_find_element_by_id(driver,id)
  debugger
  begin
    ob=driver.find_element(:id,id)
    return true
  rescue => err
    return false
  end
end
