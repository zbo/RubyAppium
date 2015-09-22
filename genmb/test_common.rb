def read_file(file)
  result=''
  file.each_line do |line|
    result=result+line.tr("\n",' ')
  end
  return result
end

def json_to_hash(json)
  json_result = JSON.parse json
  return json_result
end
