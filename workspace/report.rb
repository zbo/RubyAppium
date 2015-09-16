require 'debugger'
require 'uuid'
require 'json'

class Log
  $succeed=1
  $failed=0
  $screen_cut_on='screen_shoot_needed'
  $screen_cut_off='screen_shoot_no_need'
  def initialize(content,status,screenfile)
    @content=content
    @status=status
    @screen=screenfile
  end
end

class Report
  def initialize(filePath)
    @filePath=filePath
    @all=[]
  end

  def log(content,status)
    log=Log.new(content,status,'')
    @all.push(log)
  end

  def logs(content,status,scrren)
    logfile=self.screencut()
    log=Log.new(content,status,logfile)
    @all.push(log)
  end

  def screencut()
    debugger
    filename=rand(999999).to_s+'-'+rand(999999).to_s+'-'+rand(999999).to_s+'.png'
    cmd_cut='adb shell /system/bin/screencap -p /sdcard/'+filename
    system cmd_cut
    cmd_copy='adb pull /sdcard/'+filename+' '+@filePath+'screen'
    system cmd_copy
    cmd_clean='adb shell rm /sdcard/'+filename
    system cmd_clean
    return filename
  end

  def renderall(filename)
    file=open(@filePath+filename,'a')
    @all.each do |one|
      hash = {}
      one.instance_variables.each{|var| hash[var.to_s.delete("@")] = one.instance_variable_get(var)}
      file.puts(hash.to_json)
    end
    file.close()
    return @all
  end
end
