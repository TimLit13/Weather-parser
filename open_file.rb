def open_file name_of_file
  file_list_of_cities = File.open "#{name_of_file}", 'r'
end