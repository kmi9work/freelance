#encoding:utf-8
srand(111)

contacts = {"skype" => %w(Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua), 
            "ICQ" => ["131113313", "212222111", "222121221", "222622662", "222666626", "222922992", "244224224", "400000039"], 
            "email" => %w(yahoo@yahoo.com phuck_it@yahoo.com yourmomlives@yahoo.com iama@hotmail.com gangstersare@gmail.com daraia5@yahoo.com missd0c@aol.com itsunvisible@yahoo.com), 
            "jabber" => %w(yahoo@yahoo.com phuck_it@yahoo.com yourmomlives@yahoo.com iama@hotmail.com gangstersare@gmail.com daraia5@yahoo.com missd0c@aol.com itsunvisible@yahoo.com), 
            "vk" => %w(vk.com/yahoo vk.com/phuck_it vk.com/yourmomlives vk.com/iama vk.com/gangstersare vk.com/daraia5 vk.com/missd0c vk.com/itsunvisible)}
comments = ["А также в 21.00 в PS: Операция \"Немыслимое\": как Черчилль готовил войну против Сталина, Спецрепортаж из Крымска, Рискованная игра И.Каримова", "Брейвик заслуживает ТОЛЬКО смертной казни. Но абсурдным подходом к правам человека Европа загнала себя в угол.", "Ведущий аналитической программы Постскриптум, председатель Комитета по международным делам Государственной Думы", "ВТО дает выгоды экспортерам, улучшает инвестклимат, а бьет по сельскому хоз-ву и ряду производств. Их надо защитить.И Китай, и Куба - в ВТО.", "Вступление в ВТО - как решение прыгнуть в прорубь: выплывешь -оздоровишься, унесет течением - значит,не надо было прыгать. Исход неизвестен.", "Г-н Кацима, к-ый занес меня в \"список смерти\", пишет мне: \"Россия - военный преступник\". Но за военные преступления судили не нас, а Японию!", "Госдума утвердила соглашение с США, облегчающее получение 3-летних виз: противоречия между странами не должны мешать людским контактам.", "И теперь, убив 77 человек, он может ждать освобождения через 21 год! Бред – и только.", "Кофи Аннан ушел со своего поста. Его мирный план сорван. Теперь в Сирии все решится на поле боя. Война в полной мере вступила в свои права.", "Мутко обещает\"жесткие выводы\" после игр в Лондоне. А после провала в Ванкувере, видимо, были \"мягкие\"? И какие же выводы будут после Сочи ?", "Недаром он довольно улыбался, когда выслушал приговор", "На Олимпиаде в Ванкувере мы были на 11-м месте по медалям, сейчас же - на 10-ом! Это прогресс. И уже почти наизусть знаем гимны Китая и СШA.", "Норковой революции с заменой Путина на Навального не будет. А если будет, то лево-националистическая, к-ая сметет нынешних \"буревестников\".", "Опять пишут, что Гитлер бежал в Аргентину. Зная, сколько мифов считаются фактами - от убийства Кеннеди до 11.09.2001,это исключить нельзя.", "Поздравляю волейболистов ! Тетюхин - гений,таких еще родит наша земля!Блистательная победа над США ! Главное - сила воли, сила духа. Браво !", "При этом Ассанжу, который никого не убил, в случае выдачи его США, грозит смертная казнь. Каково?", "Сегодня в PS:от Булгарии до Крымска - обречены ли мы на всеобщую безответственность? Вступление в ВТО : пан или пропал? Финал сессии Госдумы", "Спасибо за поддержку ! Я знаю: у PS -умный и понимающий зритель, для к-го приятно работать. Всем вам - отличного лета и прекрасного отдыха!", "У нас революции хотят дамы в норковых шубах и джинсах за $2000, обожающие олигархов, плюс модные писатели и музыканты. А потому ее не будет", "Хобби Х.Клинтон -нападать на Россию из-за Сирии. В этом плане она могла бы стать госсекретарем и у Ромни - их взгляды во многом смыкаются."]
requests = ["Готов к задаче!", "Могу только по пятницам", "Каждый день в любое время", "Я готов.", "Всегда готов!", "Имею некоторый опыт. Могу попробовать", "Есть.", "+1", "Очень интересная идея. Я за.", "Участвую."]
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
    rand(contacts.size).times do
      cont = contacts.to_a[rand(contacts.size)]
      Contact.create(name: cont[0], value: cont[1][rand(cont[1].size)])
    end
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

camrades = []

10.times do |i|
  c = Camrade.create(:first_name => names[rand(names.size)], :second_name => second_names[rand(second_names.size)], :email => "camrade#{i}@eot.su", :password => "camrade#{i}", :password_confirmation => "camrade#{i}", sex: rand(2))
  c.country = country
  c.city = cities[rand(cities.size)]
  c.save
  
  camrades << c
end

first = camrades[0]
second = camrades[1]

resumes = [
  Resume.create({title: "Инженер", description: "Успешный опыт проектирования крупных объектов. Уверенный пользователь ПК (MS Office: Word, Excel, Outlook; AutoCAD; Internet). Знание нормативной документации по проектированию"}),
  Resume.create({title: "Программист", description: "профессиональный пользователь ПК (Microsoft Windows 95–ME,Microsoft Windows NT4–XP, Linux, FreeBSD). знание PHP, SQL, JavaScript, Visual Basic, VBScript, C, C++, Java, Python, Perl, Object Pascal, Assembler. Умение проектировать информационные системы, реляционные базы данных (Borland Interbase SQL server 6.0, Firebird SQL server 1.0, MySQL server 4.0, Microsoft Access XP)"}),
  Resume.create({title: "Бухгалтер", description: "Отличное знание налогового, гражданского, трудового законодательства. Хорошие теоретические знания бухгалтерского учета, проводок. Опытный пользователь ПК: MS Office: Word, Excel, Outlook; «1С: Зарплата и кадры 7.7», «1С: Предприятие», программы банк-клиент, Консультант + и др."})
]

resumes[0].area = Area.find_by_name("Электроника, радиотехника, связь")
resumes[0].specializations << Specialization.find_by_name("Инженер по оборудованию") 
resumes[0].specializations << Specialization.find_by_name("Инженер-конструктор")

resumes[1].area = Area.find_by_name("Физика, математика, ИТ")
resumes[1].specializations << Specialization.find_by_name("Системный администратор")
resumes[1].specializations << Specialization.find_by_name("Системный аналитик")
resumes[1].specializations << Specialization.find_by_name("Специалист по информационной безопасности")

resumes[2].area = Area.find_by_name("Экономика и менеджмент")
resumes[2].specializations << Specialization.find_by_name("Бухгалтер")

first.resumes << resumes[0]
first.resumes << resumes[1]
second.resumes << resumes[2]


messages = Message.create([{content: "first message.", unread: false}, {content: "Hello", unread: true}, {content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", unread: true}])
first.messages += messages
second.sents += messages

projects = Project.create([
  {title: "Сканирование рисунков", description: "Требуется несколько человек, для помощи в сканировании рисунков, полученных в ходе социологического исследования детей.", country_id: country.id, city_id: cities[rand(cities.size)], camrade_id: (rand(5)+1)}, 
  {title: "Для доработки сайта требуется верстальщик под Drupal 6", description: "Не просто человек, который знает HTML и CSS, но который понимает, как устроен друпал и как под него верстать. По всем вопросам обращайтесь в <a href=\"http://eot.su/messages/new/375?destination=user%2F375\">личку</a> или на почту <email>pamir75@yandex.ru</email>", country_id: country.id, city_id: cities[rand(cities.size)], camrade_id: (rand(5)+1)}, 
  {title: "Сбор подписей против Ювенальной Юстиции", description: "Сбор подписей граждан против введения в России ювенальной системы продолжается. В связи с появлением новых обстоятельств (принята \"Национальная стратегия действий в интересах детей на 2012 - 2017 г.г.\") просим вас, начиная с 09.07.2012 г., собирать подписи под новым вариантом письма. Ближе к осени оба варианта письма с подписями (повторно собирать от уже подписавшихся не нужно!) будут переданы в приемную Президента РФ и другие инстанции. О сроках передачи писем из регионов в ЭТЦ мы сообщим позже.", country_id: country.id, city_id: cities[rand(cities.size)], camrade_id: (rand(5)+1)}, 
  {title: "Набор волонтеров для помощи Крымску", description: "Создана группа для набора желающих помочь Крымску. Все подробности в <a href=\"http://eot.su/actions/group/12535\">группе</a> Предлагаем ознакомиться с этим объявлением, оценить свои возможности и обращаться непосредственно к Сергею Козлову (номер лички на сайте ЕОТ: <a href=\"http://eot.su/user/38\">http://eot.su/user/38</a> , скайп-ник: sergey_v_kozlov, моб.телефон: 8-925-729-28-29, мэйл: <email>eot77@narod.ru</email>).", country_id: country.id, city_id: cities[rand(cities.size)], camrade_id: (rand(5)+1)}, 
  {title: "Требуются инженеры для НИИТВ", description: "НИИТВ требуются инженеры, обладающие опытом проектирования крупных объектов. Необходимо знание AutoCAD и других инжереных пакетов.", country_id: country.id, city_id: cities[rand(cities.size)], camrade_id: (rand(5)+1)},
  {title: "Разработка энциклопедии СВ", description: "С интересным поиском по статьям и системой обсуждения по принципу habrahabr.ru и stackoverflow.com.", country_id: country.id, city_id: cities[rand(cities.size)], camrade_id: (rand(5)+1)},
  {title: "Строительство школы", description: "Важным фактором, определяющим перспективу сельской школы, являются демографические процессы. Система образовательной сети складывалась исторически вместе с формированием системы расселения. География областей России такова, что большая часть территорий удалена от областных центров, где расположены основные школы. Демографические особенности в сельской местности таковы, что, одновременно существует большое разнообразие  типов школ по вместимости, от 1200 учащихся на Юге страны до 40 учащихся в средней полосе и Сибири. Радикальные экономические преобразования в России на рубеже XX-XXI вв. не могли не отразиться на организации жизнедеятельности на селе. На сегодняшний день, в отличие от развитых стран мира, где сельская местность традиционно является объектом внимательного ухода и тщательного проектирования, наши  сельские территории оказались средой, мало приспособленной для высокопроизводительного труда и отдыха.", country_id: country.id, city_id: cities[rand(cities.size)], camrade_id: (rand(5)+1)},
  {title: "Кружок программирования", description: "Есть возможность организовать в школе № 111 кружок программирования для детей любых возрастов.", country_id: country.id, city_id: cities[rand(cities.size)], camrade_id: (rand(5)+1)}  
])

comments.map! do |comment|
  Comment.create(content: comment, camrade_id: camrades[rand(camrades.size)])
end

requests.map! do |request|
  Request.create(message: request, camrade_id: camrades[rand(camrades.size)])
end

projects.each do |p|
  rand(comments.size).times do
    p.comments << comments[rand(comments.size)]
  end
end

projects.each do |p|
  rand(requests.size).times do
    p.requests << requests[rand(requests.size)]
  end
end

projects.each do |p|
  rand(4).times do
    a = areas[rand(areas.size)]
    p.areas << a
    rand(a.specializations.count).times do
      p.specializations << Specialization.last(rand(a.specializations.count)).first
    end
  end
end




# 
# <li><label class="form-box m-form-box_radio"><input type="checkbox" name="specializationId" value=".*?"/><span>(.+?)</span></label></li>
# {name: "$1"}, 