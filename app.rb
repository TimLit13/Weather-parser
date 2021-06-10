#encoding: cp866
require 'mechanize'
require_relative 'open_file.rb'

#загрузить список городов
file_list_of_cities = open_file ('list_of_cities.txt')

@cities = {}
file_list_of_cities.each_line do |line|
  temp = []
  temp = line.strip.split(/[:,]/)

  # puts temp
  # puts temp.inspect
  # puts temp.length
  @cities[temp[0]] = temp[1]
end



#-----------------------------
# debug

 puts =*80
 @cities.each do |key, value|
   puts "#{key}\t#{value}"
 end
 puts =*80

#-----------------------------



#Создать экземпляр "браузера""
agent = Mechanize.new()

#скачать страницу
# page = agent.get("https://www.meteoservice.ru/weather/14days/sankt-peterburg")
# arr = []
# arr = page.search("//tr[starts-with(@id, 'callout forecast-row weekend')]").to_a