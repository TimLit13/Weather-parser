#encoding: cp866
require 'mechanize'
require_relative 'open_file.rb'
require_relative 'extract_hash_from_file.rb'

#загрузить список городов
file_list_of_cities = open_file ('list_of_cities.txt')

#создать хэш из файла с городами и их идентификаторами
@cities_hash = extract_hash_from_file (file_list_of_cities)



#-----------------------------
# debug

@cities_hash.each do |key, value|
  puts '='*80
  puts "#{key}\t#{value}"
end
puts '='*80

#-----------------------------



#Создать экземпляр "браузера""
agent = Mechanize.new()

#скачать страницу
# page = agent.get("https://www.meteoservice.ru/weather/14days/sankt-peterburg")
# arr = []
# arr = page.search("//tr[starts-with(@id, 'callout forecast-row weekend')]").to_a