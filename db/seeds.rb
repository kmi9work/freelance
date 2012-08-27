#encoding:utf-8


names = ["Александра", "Александр", "Анастасия", "Андрей", "Анна", "Артем", "Виктория", "Даниил", "Дарья", "Дмитрий", "Егор", "Екатерина", "Елизавета", "Иван", "Максим", "Мария", "Михаил", "Никита", "Полина", "Софья"]
second_names = ["Смирнов", "Иванов", "Кузнецов", "Попов", "Соколов", "Лебедев", "Козлов", "Новиков", "Морозов", "Петров", "Волков", "Соловьев", "Васильев", "Зайцев", "Павлов", "Семенов", "Голубев", "Виноградов", "Богданов", Воробьев]
country_file = File.open 'lib/data/countries.txt', 'r'
city_russia_file = File.open 'lib/data/cities.txt', 'r'
countries = []
while country_file.gets
  countries << Country.create({name: $_.strip})
end
puts "Countries: #{countries.size}"
cities = []
country = Country.find_by_name('Россия')
while city_russia_file.gets
  if $_ =~ /(.*) \((.+)\)/u
    region = Region.find_or_create_by_name($2.strip)
    c = City.new({name: $1.strip})
    c.region = region
    c.country = country
    c.save
    cities << c
  else
    next
  end
end
puts "Cities: #{cities.size}"

prof_file = File.open('lib/data/proffessions.txt', 'r')

areas = []

while prof_file.gets
  if $_.blank?
    next
  elsif $_ =~ /^=(.+)/
    area = Area.create(name: $1.strip)
    areas << area
  else
    s = Specialization.new(name: $_.strip)
    s.area = areas[-1]
    s.save
  end
end

# areas = Area.create([{name: "Информационные технологии, интернет, телеком"}, {name: "Бухгалтерия, управленческий учет, финансы предприятия"}, {name: "Маркетинг, реклама, PR"}, {name: "Административный персонал"}, {name: "Банки, инвестиции, лизинг"}, {name: "Управление персоналом, тренинги"}, {name: "Автомобильный бизнес"}, {name: "Безопасность"}, {name: "Высший менеджмент"}, {name: "Добыча сырья"}, {name: "Искусство, развлечения, масс-медиа"}, {name: "Консультирование"}, {name: "Медицина, фармацевтика"}, {name: "Наука, образование"}, {name: "Государственная служба, некоммерческие организации"}, {name: "Продажи"}, {name: "Производство"}, {name: "Страхование"}, {name: "Строительство, недвижимость"}, {name: "Транспорт, логистика"}, {name: "Туризм, гостиницы, рестораны"}, {name: "Юристы"}, {name: "Спортивные клубы, фитнес, салоны красоты"}, {name: "Инсталляция и сервис"}, {name: "Закупки"}, {name: "Начало карьеры, студенты"}, {name: "Домашний персонал"}, {name: "Рабочий персонал"}])
# 
# specializations = Specialization.create([{name: "CRM системы"}, {name: "CTO, CIO, Директор по IT"}, {name: "Web инженер"}, {name: "Web мастер"}, {name: "Администратор баз данных"}, {name: "Аналитик"}, {name: "Арт-директор"}, {name: "Банковское ПО"}, {name: "Игровое ПО"}, {name: "Инженер"}, {name: "Интернет"}, {name: "Компьютерная безопасность"}, {name: "Консалтинг, Аутсорсинг"}, {name: "Контент"}, {name: "Маркетинг"}, {name: "Мультимедиа"}, {name: "Начальный уровень, Мало опыта"}, {name: "Оптимизация сайта (SEO)"}, {name: "Передача данных и доступ в интернет"}, {name: "Поддержка, Helpdesk"}, {name: "Программирование, Разработка"}, {name: "Продажи"}, {name: "Продюсер"}, {name: "Развитие бизнеса"}, {name: "Сетевые технологии"}, {name: "Системная интеграция"}, {name: "Системный администратор"}, {name: "Системы автоматизированного проектирования"}, {name: "Системы управления предприятием (ERP)"}, {name: "Сотовые, Беспроводные технологии"}, {name: "Стартапы"}, {name: "Телекоммуникации"}, {name: "Тестирование"}, {name: "Технический писатель"}, {name: "Управление проектами"}, {name: "Электронная коммерция"}])
# specializations.each{|s| s.area = Area.find_by_name("Информационные технологии, интернет, телеком"); s.save}
# 
# specializations = Specialization.create([{name: "ACCA"}, {name: "CIPA"}, {name: "GAAP"}, {name: "Аудит"}, {name: "Бухгалтер"}, {name: "Бухгалтер-калькулятор"}, {name: "Бюджетирование и планирование"}, {name: "Валютный контроль"}, {name: "Казначейство"}, {name: "Кассир, Инкассатор"}, {name: "Кредитный контроль"}, {name: "МСФО, IFRS"}, {name: "Налоги"}, {name: "Начальный уровень, Мало опыта"}, {name: "Основные средства"}, {name: "Оффшоры"}, {name: "Первичная документация"}, {name: "Планово-экономическое управление"}, {name: "Расчет себестоимости"}, {name: "Руководство бухгалтерией"}, {name: "ТМЦ"}, {name: "Учет заработной платы"}, {name: "Учет счетов и платежей"}, {name: "Финансовый анализ"}, {name: "Финансовый контроль"}, {name: "Финансовый менеджмент"}, {name: "Ценные бумаги"}, {name: "Экономист"}])
# specializations.each{|s| s.area = Area.find_by_name("Бухгалтерия, управленческий учет, финансы предприятия"); s.save}

@camrades = []

5.times do |i|
  c = Camrade.create(:first_name => "Camrade#{i}", :email => "camrade#{i}@eot.su", :password => "camrade#{i}", :password_confirmation => "camrade#{i}", sex: rand(2))
  c.save
  @camrades << c
end

first = @camrades[0]
second = @camrades[1]

resumes = Resume.create([
  {title: "Инженер", description: "Успешный опыт проектирования крупных объектов. Уверенный пользователь ПК (MS Office: Word, Excel, Outlook; AutoCAD; Internet). Знание нормативной документации по проектированию"}, 
  {title: "Программист", description: "профессиональный пользователь ПК (Microsoft Windows 95–ME,Microsoft Windows NT4–XP, Linux, FreeBSD). знание PHP, SQL, JavaScript, Visual Basic, VBScript, C, C++, Java, Python, Perl, Object Pascal, Assembler. Умение проектировать информационные системы, реляционные базы данных (Borland Interbase SQL server 6.0, Firebird SQL server 1.0, MySQL server 4.0, Microsoft Access XP)"},
  {title: "Бухгалтер", description: "Отличное знание налогового, гражданского, трудового законодательства. Хорошие теоретические знания бухгалтерского учета, проводок. Опытный пользователь ПК: MS Office: Word, Excel, Outlook; «1С: Зарплата и кадры 7.7», «1С: Предприятие», программы банк-клиент, Консультант + и др."}
])
first.resumes << Resume.find_by_title("Инженер")
# first.resumes[0].specialization_names = "Web инженер, Web мастер, Администратор баз данных"
first.resumes << Resume.find_by_title("Программист")
# first.resumes[1].specialization_names = "Интернет, Оптимизация сайта (SEO), Стартапы"
second.resumes << Resume.find_by_title("Бухгалтер")
# second.resumes[0].specialization_names = "Бухгалтер, Бухгалтер-калькулятор"

messages = Message.create([{content: "first message.", unread: false}, {content: "Hello", unread: true}, {content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", unread: true}])
first.messages += messages
second.sents += messages

projects = Project.create([
  {title: "Сканирование рисунков", description: "Требуется несколько человек, для помощи в сканировании рисунков, полученных в ходе социологического исследования детей.", country_id: country.id, city_id: cities[rand(cities.size)], camrade_id: (rand(5)+1)}, 
  {title: "Для доработки сайта требуется верстальщик под Drupal 6", description: "Не просто человек, который знает HTML и CSS, но который понимает, как устроен друпал и как под него верстать. По всем вопросам обращайтесь в <a href=\"http://eot.su/messages/new/375?destination=user%2F375\">личку</a> или на почту <email>pamir75@yandex.ru</email>", country_id: country.id, city_id: cities[rand(cities.size)], camrade_id: (rand(5)+1)}, 
  {title: "Сбор подписей против Ювенальной Юстиции", description: "Сбор подписей граждан против введения в России ювенальной системы продолжается. В связи с появлением новых обстоятельств (принята \"Национальная стратегия действий в интересах детей на 2012 - 2017 г.г.\") просим вас, начиная с 09.07.2012 г., собирать подписи под новым вариантом письма. Ближе к осени оба варианта письма с подписями (повторно собирать от уже подписавшихся не нужно!) будут переданы в приемную Президента РФ и другие инстанции. О сроках передачи писем из регионов в ЭТЦ мы сообщим позже.", country_id: country.id, city_id: cities[rand(cities.size)], camrade_id: (rand(5)+1)}, 
  {title: "Набор волонтеров для помощи Крымску", description: "Создана группа для набора желающих помочь Крымску. Все подробности в <a href=\"http://eot.su/actions/group/12535\">группе</a> Предлагаем ознакомиться с этим объявлением, оценить свои возможности и обращаться непосредственно к Сергею Козлову (номер лички на сайте ЕОТ: <a href=\"http://eot.su/user/38\">http://eot.su/user/38</a> , скайп-ник: sergey_v_kozlov, моб.телефон: 8-925-729-28-29, мэйл: <email>eot77@narod.ru</email>).", country_id: country.id, city_id: cities[rand(cities.size)], camrade_id: (rand(5)+1)}, 
  {title: "Требуются инженеры для НИИТВ", description: "НИИТВ требуются инженеры, обладающие опытом проектирования крупных объектов. Необходимо знание AutoCAD и других инжереных пакетов.", country_id: country.id, city_id: cities[rand(cities.size)], camrade_id: (rand(5)+1)}
])




# 
# <li><label class="form-box m-form-box_radio"><input type="checkbox" name="specializationId" value=".*?"/><span>(.+?)</span></label></li>
# {name: "$1"}, 