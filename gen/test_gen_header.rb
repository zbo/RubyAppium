require 'debugger'
require 'test/unit'
require File.expand_path('../gen', __FILE__)

class Gen_Header < Test::Unit::TestCase
  def test_gen
    p '='*20+'start test'+'='*20
    gen=Gen.new()
    p gen.name()
    header=gen.header()
    p 'total lines in header: '+header.size.to_s
    p "="*50
  end

  def print_file(file)
    counter=0
    while (line = file.gets)
        puts "#{counter}: #{line}"
        counter = counter + 1
    end
  end
end
