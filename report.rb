require 'debugger'
require 'uuid'

class Log
  $succeed=1
  $failed=0
  def initialize(content,status)
    @content=content
    @status=status
    @screen=''
  end
end

class Report
  def initialize(filePath)
    @filePath=filePath
    @all=[]
  end

  def log(content,status)
    #debugger
    log=Log.new(content,status)
    @all.push(log)
  end

  def renderall
    p 'render to file'
    #debugger
    file=open(@filePath+Time.new.strftime("%Y-%m-%d-%H:%M:%S")+'-'+rand(999999).to_s,'a')
    #file.puts('aaaaaabbbbbbb')
    file.close()
    return @all
  end
end
