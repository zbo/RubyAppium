require 'debugger'
class Button_click
  def initialize(json)
    @id=json[0]['id']
  end
  def render
    return 'render button click'
  end
end
class Send_keys
  def initialize(json)
    @id=json[0]['id']
    @keys=json[0]['keys']
  end
  def render
    return 'render send keys'
  end
end
class Assert_text_equal
end
