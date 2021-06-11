@cities = {}

def extract_hash_from_file (file_list_of_cities)

file_list_of_cities.each_line do |line|
  temp = []
  line = line.strip.gsub(/[^\p{L}\s\d]/,'').gsub(/[\u{10000}-\u{FFFFF}]/,'').delete('\\')
  temp = line.split(" ")

  # #debug
  # puts temp
  # puts temp.inspect
  # puts temp.length
 
  @cities[temp[1]] = temp[0]
end

  return @cities
end