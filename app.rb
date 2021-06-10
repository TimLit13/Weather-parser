#encoding: utf-8
require 'mechanize'
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




#Создать экземпляр "браузера" cc
agent = Mechanize.new()

#скачать страницу с помощью Mechanize
page = agent.get(url)



#скачать страницу с помощью Nokogiri
unparsed_page = URI.open(url)
parsed_page  = Nokogiri::HTML(unparsed_page)

all_days_of_week = page.search('h3').xpath('text()')

# #debug
# all_days_of_week.each do |day_of_week|
#   puts day_of_week
# end








