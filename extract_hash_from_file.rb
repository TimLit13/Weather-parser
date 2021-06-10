def extract_hash_from_file (file_list_of_cities)

@cities = {}

file_list_of_cities.each_line do |line|
  temp = []
  temp = line.strip.split(/[:,]/)

  # puts temp
  # puts temp.inspect
  # puts temp.length
 
  @cities[temp[0]] = temp[1]
end
  return @cities
end