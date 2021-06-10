#encoding: cp866
require 'mechanize'
require 'translit'
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

user_city = gets.chomp.downcase
user_city = Translit.convert(user_city, :english)

#дебаг
#puts user_city


#Создать экземпляр "браузера""
agent = Mechanize.new()

#скачать страницу
page = agent.get("https://www.meteoservice.ru/weather/14days/#{user_city}")

#дебаг
puts page.body

puts "Прогноз погоды взят с сайта: \"https://www.meteoservice.ru/\""

# arr = []
# arr = page.search("//tr[starts-with(@id, 'callout forecast-row weekend')]").to_a