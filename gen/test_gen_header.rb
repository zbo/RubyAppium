require 'debugger'
require 'test/unit'
require './gen.rb'

class Gen_Header < Test::Unit::TestCase
  def test_gen
    p '='*20+'start test'+'='*20
    gen=Gen.new()
    p gen.name()
    gen.header()
    p "="*50
  end

  def json_to_hash(json)
    json_result = JSON.parse json
    return json_result
  end

  def print_file(file)
    counter=0
    while (line = file.gets)
        puts "#{counter}: #{line}"
        counter = counter + 1
    end
  end

  def read_file(file)
    result=''
    file.each_line do |line|
      result=result+line.tr("\n",' ')
    end
    return result
  end
end
