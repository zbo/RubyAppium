require 'debugger'
require 'json'

class Gen
  def initialize

  end

  def generate(json)
    action_all=[]
    json.each do |j|
      p j
    end
  end

  def name
    return 'test script generator (I am the king :-)'
  end

  def parse
  end
end
