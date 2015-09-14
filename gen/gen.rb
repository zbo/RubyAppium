require 'debugger'
require 'json'
require './action.rb'

class Gen
  WORK_SPACE = '../workspace/'
  def initialize

  end
  def generate
  end

  def action_body(json)
    action_all=[]
    json.each do |j|
      class_name=j['action']
      class_meta = Object.const_get(class_name)
      action=class_meta.new(j['arguments'])
      p action
    end
    p WORK_SPACE
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
