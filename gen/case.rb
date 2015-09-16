require 'debugger'
class Case
  def initialize(json)
    @case=json['case']['meta'][0]['test']
  end
  def set_actions(actions)
    @actions=actions
  end
  def get_actions
    return @actions
  end
end
