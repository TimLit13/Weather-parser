def show_weather (options={})
  all_days_of_week = options[:all_days_of_week]
  all_dates = options[:all_dates]
  all_weather = options[:all_weather]
  all_temperature = options[:all_temperature]
  chance_of_precipitation = options[:chance_of_precipitation]
  all_winds = options[:all_winds]

  (0..13).each do |index|
    puts '='*80
    print "Дата: "
    puts all_dates[index]
    print "День недели: "
    puts all_days_of_week[index]
    print "Погода: "
    puts all_weather[index]
    print "Температура макс: "
    puts all_temperature[(index)*2]
    print "Температура мин: "
    puts all_temperature[(index)*2+1]
    print "Вероятность осадков: "
    puts chance_of_precipitation[index]
    print "Скорость ветра: "
    puts all_winds[(index)*4+3]
    print "Направление ветра: "
    puts all_winds[(index)*4+2]

      
  end

  puts '='*80
  puts "Прогноз погоды взят с сайта: \"https://www.meteoservice.ru/\""

end

