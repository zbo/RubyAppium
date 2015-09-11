require 'debugger'
require 'json'
require './action.rb'

class Gen
  WORK_SPACE = '../workspace/'
  def initialize

  end

  def generate(json)
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
    p 'generate header'
    file = File.new("./header.rb", "r")
    str_header = read_file(file)
    p str_header
  end

  def name
    return 'test script generator (I am the king :-)'
  end

  def parse
  end
end
