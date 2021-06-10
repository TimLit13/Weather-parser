#encoding: utf-8
require 'translit'
require 'nokogiri'
require 'httparty'
require 'open-uri'
require_relative 'helpers/open_file.rb'
require_relative 'helpers/extract_hash_from_file.rb'

#загрузить список городов
file_list_of_cities = open_file ('source/list_of_cities.txt')

#создать хэш из файла с городами и их идентификаторами
@cities_hash = extract_hash_from_file (file_list_of_cities)

# -----------------------------

def debug
  @cities_hash.each do |key, value|
    puts '='*80
    puts "#{key}\t#{value}"
  end
  puts '='*80
end

# debug()

# -----------------------------


#Запрос данных от пользователя
puts "Прогноз погоды на 2 недели"
print "Укажите, какой город нужен: "

#user_city = gets.chomp.downcase
user_city = "Санкт-Петербург"
user_city = Translit.convert(user_city, :english)
puts user_city
url = "https://www.meteoservice.ru/weather/14days/#{user_city}"

#дебаг
#puts user_city

#скачать страницу с помощью Nokogiri
unparsed_page = URI.open(url)
parsed_page  = Nokogiri::HTML(unparsed_page)

all_days_of_week = parsed_page.search('h3').xpath('text()')

# #debug
# all_days_of_week.each do |day_of_week|
#   puts day_of_week
# end

all_dates = parsed_page.search(".//*[starts-with(@class, 'text-nowrap grey show-for-large')]").xpath('text()').to_a

# #debug
# all_dates.each do |date|
#   puts date
# end

all_weather = parsed_page.search(".//*[starts-with(@class, 'column show-for-smedium text-left')]").xpath('text()').to_a

# all_weather.each do |weather|
#   puts weather
# end






