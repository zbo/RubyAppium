require 'debugger'
require 'json'
require './action.rb'

class Gen
  WORK_SPACE = '../workspace/'
  def initialize

  end
  def generate(json)
    headers=header()
    render_header('script.rb',header)
    actions=action_body(json)
    #debugger
    p 'gen end'
  end

  def render_header(file_name,header)
    file = File.new(WORK_SPACE+file_name, "w")
    file.puts(header)
    file.close()
  end

  def action_body(json)
    action_all=[]
    json.each do |j|
      class_name=j['action']
      class_meta = Object.const_get(class_name)
      action=class_meta.new(j['arguments'])
      action_all.push(action)
    end
    return action_all
  end

  def header
    file = File.new("./header.rb", "r")
    header=[]
    file.each_line do |line|
      header.push(line)
    end
    return header
  end

  def name
    return 'test script generator (I am the king :-)'
  end
end
