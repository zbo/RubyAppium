require 'debugger'
class Case
  def initialize(json)
    @case=json['case']['meta'][0]['test']
  end
  def set_actions(actions)
    @actions=actions
  end
end
