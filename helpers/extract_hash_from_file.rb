@cities = {}

def extract_hash_from_file (file_list_of_cities)

file_list_of_cities.each_line do |line|
  temp = []
  temp = line.strip.split(/[:,]/)

  # puts temp
  # puts temp.inspect
  # puts temp.length
 
  @cities[temp[1]] = temp[0]
end
  return @cities
end