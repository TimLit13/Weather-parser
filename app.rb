#encoding: utf-8
require 'translit'
require 'nokogiri'
require 'httparty'
require 'open-uri'
require_relative 'helpers/open_file.rb'
require_relative 'helpers/extract_hash_from_file.rb'
require_relative 'helpers/display_weather_for_user.rb'


#загрузить список городов
file_list_of_cities = open_file ('source/list_of_cities.txt')

#создать хэш из файла с городами и их идентификаторами
@cities_hash = extract_hash_from_file (file_list_of_cities)

#Запрос данных от пользователя
puts "Прогноз погоды на 2 недели"
print "Укажите, какой город нужен: "

#user_city = gets.chomp.downcase
user_city = "Санкт-Петербург"
if @cities_hash[user_city]
  user_city = Translit.convert(user_city, :english)
  puts 'Погода в городе ' + user_city
  url = "https://www.meteoservice.ru/weather/14days/#{user_city}"
else
  puts 'Такой город отсутствует'
  exit 
end

#скачать страницу с помощью Nokogiri
unparsed_page = URI.open(url)
parsed_page  = Nokogiri::HTML(unparsed_page)

@all_days_of_week = parsed_page.search('h3').xpath('text()')
@all_dates = parsed_page.search(".//*[starts-with(@class, 'text-nowrap grey show-for-large')]").xpath('text()').to_a
@all_weather = parsed_page.search(".//*[starts-with(@class, 'column show-for-smedium text-left')]").xpath('text()').to_a
@all_temperature = parsed_page.search(".//*[starts-with(@class, 'value colorize-server-side')]").xpath('text()').to_a
#chance_of_precipitation - is rain or snow
@chance_of_precipitation = parsed_page.search(".//*[starts-with(@class, 'precip-prob value')]").xpath('text()').to_a
@all_winds = parsed_page.search(".//*[starts-with(@class, 'value')]").xpath('text()').to_a

@options = {}
@options[:all_days_of_week] = @all_days_of_week
@options[:all_dates] = @all_dates
@options[:all_weather] = @all_weather 
@options[:all_temperature] = @all_temperature 
@options[:chance_of_precipitation] = @chance_of_precipitation
@options[:all_winds] = @all_winds

#debug_parsed_array @all_days_of_week
#debug_parsed_array @all_dates
#debug_parsed_array @all_weather
#debug_parsed_array @all_temperature
#debug_parsed_array @chance_of_precipitation
#debug_parsed_array @all_winds

show_weather(@option)


