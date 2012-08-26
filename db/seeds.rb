#encoding:utf-8

country_file = File.open 'lib/data/countries.txt', 'r'
city_russia_file = File.open 'lib/data/cities.txt', 'r'
countries = []
while country_file.gets
  countries << Country.create({name: $_.strip})
end

cities = []
while city_russia_file.gets
  if $_ =~ /(.*)+ \((.+)\)/
    region = Region.find_or_create_by_name($2.strip)
    c = City.new({name: $1.strip})
    c.region = region
    c.country = Country.find_by_name('Россия')
    c.save
  else
    next
  end
end

prof_file = File.open('lib/data/proffessions.txt', 'r')

scopes = []

while prof_file.gets
  if $_.blank?
    next
  elsif $_ =~ /^=(.+)/
    scope = Scope.create(name: $1.strip)
    scopes << scope
  else
    s = Specialization.new(name: $_.strip)
    s.scope = scopes[-1]
    s.save
  end
end

# scopes = Scope.create([{name: "Информационные технологии, интернет, телеком"}, {name: "Бухгалтерия, управленческий учет, финансы предприятия"}, {name: "Маркетинг, реклама, PR"}, {name: "Административный персонал"}, {name: "Банки, инвестиции, лизинг"}, {name: "Управление персоналом, тренинги"}, {name: "Автомобильный бизнес"}, {name: "Безопасность"}, {name: "Высший менеджмент"}, {name: "Добыча сырья"}, {name: "Искусство, развлечения, масс-медиа"}, {name: "Консультирование"}, {name: "Медицина, фармацевтика"}, {name: "Наука, образование"}, {name: "Государственная служба, некоммерческие организации"}, {name: "Продажи"}, {name: "Производство"}, {name: "Страхование"}, {name: "Строительство, недвижимость"}, {name: "Транспорт, логистика"}, {name: "Туризм, гостиницы, рестораны"}, {name: "Юристы"}, {name: "Спортивные клубы, фитнес, салоны красоты"}, {name: "Инсталляция и сервис"}, {name: "Закупки"}, {name: "Начало карьеры, студенты"}, {name: "Домашний персонал"}, {name: "Рабочий персонал"}])
# 
# specializations = Specialization.create([{name: "CRM системы"}, {name: "CTO, CIO, Директор по IT"}, {name: "Web инженер"}, {name: "Web мастер"}, {name: "Администратор баз данных"}, {name: "Аналитик"}, {name: "Арт-директор"}, {name: "Банковское ПО"}, {name: "Игровое ПО"}, {name: "Инженер"}, {name: "Интернет"}, {name: "Компьютерная безопасность"}, {name: "Консалтинг, Аутсорсинг"}, {name: "Контент"}, {name: "Маркетинг"}, {name: "Мультимедиа"}, {name: "Начальный уровень, Мало опыта"}, {name: "Оптимизация сайта (SEO)"}, {name: "Передача данных и доступ в интернет"}, {name: "Поддержка, Helpdesk"}, {name: "Программирование, Разработка"}, {name: "Продажи"}, {name: "Продюсер"}, {name: "Развитие бизнеса"}, {name: "Сетевые технологии"}, {name: "Системная интеграция"}, {name: "Системный администратор"}, {name: "Системы автоматизированного проектирования"}, {name: "Системы управления предприятием (ERP)"}, {name: "Сотовые, Беспроводные технологии"}, {name: "Стартапы"}, {name: "Телекоммуникации"}, {name: "Тестирование"}, {name: "Технический писатель"}, {name: "Управление проектами"}, {name: "Электронная коммерция"}])
# specializations.each{|s| s.scope = Scope.find_by_name("Информационные технологии, интернет, телеком"); s.save}
# 
# specializations = Specialization.create([{name: "ACCA"}, {name: "CIPA"}, {name: "GAAP"}, {name: "Аудит"}, {name: "Бухгалтер"}, {name: "Бухгалтер-калькулятор"}, {name: "Бюджетирование и планирование"}, {name: "Валютный контроль"}, {name: "Казначейство"}, {name: "Кассир, Инкассатор"}, {name: "Кредитный контроль"}, {name: "МСФО, IFRS"}, {name: "Налоги"}, {name: "Начальный уровень, Мало опыта"}, {name: "Основные средства"}, {name: "Оффшоры"}, {name: "Первичная документация"}, {name: "Планово-экономическое управление"}, {name: "Расчет себестоимости"}, {name: "Руководство бухгалтерией"}, {name: "ТМЦ"}, {name: "Учет заработной платы"}, {name: "Учет счетов и платежей"}, {name: "Финансовый анализ"}, {name: "Финансовый контроль"}, {name: "Финансовый менеджмент"}, {name: "Ценные бумаги"}, {name: "Экономист"}])
# specializations.each{|s| s.scope = Scope.find_by_name("Бухгалтерия, управленческий учет, финансы предприятия"); s.save}

@camrades = []

5.times do |i|
  c = Camrade.create(:first_name => "Camrade#{i}", :email => "camrade#{i}@eot.su", :password => "camrade#{i}", :password_confirmation => "camrade#{i}", sex: rand(2))
  c.save
  @camrades << c
end

first = @camrades[0]
second = @camrades[1]

resumes = Resume.create([
  {title: "Программист", description: "Ruby on Rails, Java, C, Cobol, Fortran. Пишу левой задней пяткой. Лучше не берите меня на работу. Пожалеете."}, 
  {title: "Бухгалтер", description: "Умею сидеть за компьютером, проверять ексельку. Хорошая внешность. Разговорчивая и трудонелюбивая."},
  {title: "Верстальщик", description: "Владею следующими средствами вёрстки. Руки, ноги, TeX, HTML, Word. Пацан я клёвый, да и верстаю нормально, так что давай, зови меня."}
])
first.resumes << Resume.find_by_title("Программист")
# first.resumes[0].specialization_names = "Web инженер, Web мастер, Администратор баз данных"
first.resumes << Resume.find_by_title("Верстальщик")
# first.resumes[1].specialization_names = "Интернет, Оптимизация сайта (SEO), Стартапы"
second.resumes << Resume.find_by_title("Бухгалтер")
# second.resumes[0].specialization_names = "Бухгалтер, Бухгалтер-калькулятор"

messages = Message.create([{content: "first message.", unread: false}, {content: "Hello", unread: true}, {content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", unread: true}])
first.messages += messages
second.sents += messages
# 
# <li><label class="form-box m-form-box_radio"><input type="checkbox" name="specializationId" value=".*?"/><span>(.+?)</span></label></li>
# {name: "$1"}, 