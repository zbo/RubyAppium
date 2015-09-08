require 'debugger'
require 'uuid'
require 'json'

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
    log=Log.new(content,status)
    @all.push(log)
  end

  def renderall
    file=open(@filePath+Time.new.strftime("%Y-%m-%d-%H:%M:%S")+'-'+rand(999999).to_s,'a')
    @all.each do |one|
      hash = {}
      one.instance_variables.each{|var| hash[var.to_s.delete("@")] = one.instance_variable_get(var)}
      file.puts(hash.to_json)
    end
    file.close()
    return @all
  end
end
