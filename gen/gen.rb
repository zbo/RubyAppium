require 'debugger'
require 'json'
require 'fileutils'
require File.expand_path('../action', __FILE__)

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
    footer=footer()
    render_str('script.rb',footer)
    actions=action_body(json)
    render_body('script.rb',actions)
    p 'gen end here'
  end

  def render_body(file_name,actions)
    actions.each do |a|
      content=a.render()
      p content
    end
  end

  def render_str(file_name,str)
    file = File.new(WORK_SPACE+'/'+file_name, "a")
    file.puts(str)
    file.close()
  end

  def clean_all()
    FileUtils.rm_rf(WORK_SPACE)
    FileUtils.mkdir(WORK_SPACE)
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
