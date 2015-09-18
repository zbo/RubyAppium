require 'debugger'
require 'test/unit'
require File.expand_path('../gen', __FILE__)
require File.expand_path('../test_common', __FILE__)

class Render_Action < Test::Unit::TestCase
  def test_render_test_case
    p '='*20+ __method__.to_s()+'='*20
    gen=Gen.new()
    file = File.new(File.expand_path('../sample_sequence.json', __FILE__),"r")
    str_json = read_file(file)
    pure_json = json_to_hash(str_json)
    file.close()
    cases = gen.action_body(pure_json)
    p cases
    all = cases[0].render
    all.each do |item|
      p item
    end
    p "="*60
  end
end
