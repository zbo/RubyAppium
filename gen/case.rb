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

  def get_name
    return @case
  end

  def render
    all = []
    all.push(" ")
    all.push(render_method_name(@case))
    @actions.each do |a|
      all.push(a.render)
    end
    all.push(' '*2+'end')
    return all
  end

  def render_method_name(name)
    return ' '*2+"it '" + name + "' do"
  end
end
