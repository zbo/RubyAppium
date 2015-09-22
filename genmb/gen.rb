require 'debugger'
require 'json'
require 'fileutils'
require File.expand_path('../action', __FILE__)
require File.expand_path('../case', __FILE__)

class Gen
  WORK_SPACE = File.expand_path('../../workspace', __FILE__)
  def work_space
    return WORK_SPACE
  end

  def initialize

  end

  def movelibs()
    FileUtils.cp(File.expand_path('../../auto.rb', __FILE__), WORK_SPACE+'/auto.rb')
    FileUtils.cp(File.expand_path('../../page.rb', __FILE__), WORK_SPACE+'/page.rb')
    FileUtils.cp(File.expand_path('../../report.rb', __FILE__), WORK_SPACE+'/report.rb')
  end

  def generate(json)
    clean_all()
    movelibs()
    headers=header()
    render_str('script.rb',header)
    cases=action_body(json)
    render_body('script.rb',cases)
    footer=footer()
    render_str('script.rb',footer)
    p 'gen end here'
  end

  def render_body(file_name,cases)
    file = File.new(WORK_SPACE+'/'+file_name, "a")
    cases.each do |ca|
      lines=ca.render
      lines.each do |li|
        file.puts li
      end
    end
    file.close
  end

  def render_str(file_name,str)
    file = File.new(WORK_SPACE+'/'+file_name, "a")
    file.puts(str)
    file.close
  end

  def clean_all()
    FileUtils.rm_rf(WORK_SPACE)
    FileUtils.mkdir(WORK_SPACE)
  end

  def action_body(json)
    case_all=[]
    json.each do |j|
      test_case = Case.new(j)
      action_all=[]
      j['case']['actions'].each do |a|
        class_name=a['action']
        class_meta = Object.const_get(class_name)
        action=class_meta.new(a['arguments'])
        action_all.push(action)
      end
      test_case.set_actions(action_all)
      case_all.push(test_case)
    end
    return case_all
  end

  def header
    file = File.new(File.expand_path('../header.rb', __FILE__), "r")
    header=[]
    file.each_line do |line|
      header.push(line)
    end
    return header
  end

  def footer
    file = File.new(File.expand_path('../footer.rb', __FILE__), "r")
    footer=[]
    file.each_line do |line|
      footer.push(line)
    end
    return footer
  end

  def name
    return 'test script generator (I am the king :-)'
  end
end
