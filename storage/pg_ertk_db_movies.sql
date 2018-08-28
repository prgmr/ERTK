CREATE DATABASE ertk;

\connect "ertk";

DROP TABLE IF EXISTS "movies";
DROP SEQUENCE IF EXISTS movies_id_seq;
CREATE SEQUENCE movies_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."movies" (
    "id" integer DEFAULT nextval('movies_id_seq') NOT NULL,
    "title" text,
    "description" text,
    "actors" text,
    CONSTRAINT "movies_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "movies" ("id", "title", "description", "actors") VALUES
(1,	'Мстители: Война бесконечности',	'Пока Мстители и их союзники продолжают защищать мир от различных опасностей, с которыми не смог бы справиться один супергерой, новая угроза возникает из космоса: Танос. Межгалактический тиран преследует цель собрать все шесть Камней Бесконечности — артефакты невероятной силы, с помощью которых можно менять реальность по своему желанию. Всё, с чем Мстители сталкивались ранее, вело к этому моменту — судьба Земли никогда ещё не была столь неопределённой.',	'Роберт Дауни мл., Крис Хемсворт, Марк Руффало'),
(2,	'Остров собак',	'История 12-летнего мальчика Атари Кобаяши, опекаемого коррумпированным мэром Кобаяши. Когда по Указу последнего все домашние собаки города Мегасаки изгоняются на громадную свалку, Атари в одиночку отправляется на миниатюрном летательном аппарате на мусорный остров, чтобы найти своего верного пса по прозвищу Спотс. Там на острове вместе со стаей новых друзей-дворняг он начнет эпичное путешествие, которое решит будущую судьбу всей Префектуры.',	'Брайан Крэнстон, Кою Ранкин, Эдвард Нортон'),
(3,	'Дэдпул 2',	'Единственный и неповторимый болтливый наемник — вернулся! Ещё более масштабный, ещё более разрушительный и даже ещё более голозадый, чем прежде! Когда в его жизнь врывается суперсолдат с убийственной миссией, Дэдпул вынужден задуматься о дружбе, семье и о том, что на самом деле значит быть героем, попутно надирая 50 оттенков задниц. Потому что иногда чтобы делать хорошие вещи, нужно использовать грязные приёмчики.',	'Райан Рейнольдс, Джош Бролин, Морена Баккарин'),
(4,	'Лето',	'Фильм рассказывает о самом начале творческого пути Виктора Цоя и группы «Кино», о его взаимоотношениях с Майком Науменко, его женой Натальей и многими, кто был в авангарде рок-движения Ленинграда 1981 года. Это история о Ленинграде 80-х, о любви, поисках и больших надеждах — о настроении, которое останется с нами навсегда.',	'Рома Зверь, Ирина Старшенбаум, Тео Ю'),
(5,	'Суперсемейка 2',	'После событий первой части суперсемейка пользуется повышенным вниманием со стороны журналистов. Неожиданно оказалось, что обаятельная Миссис Исключительная гораздо лучше смотрится на экране телевизора, чем её муж. Мистеру Исключительному все чаще приходится сидеть дома и приглядывать за детьми, у каждого из которых есть свои причины быть недовольным собственными суперспособностями. Однако семейным проблемам предстоит отступить на второй план, когда окажется, что спокойствию Суперсемейки угрожает новый могущественный враг.',	'Крэйг Т. Нельсон, Холли Хантер, Сара Вауэлл'),
(6,	'Первому игроку приготовиться',	'Действие фильма происходит в 2045 году, мир погружается в хаос и находится на грани коллапса. Люди ищут спасения в игре OASIS — огромной вселенной виртуальной реальности. Ее создатель, гениальный и эксцентричный Джеймс Холлидэй, оставляет уникальное завещание. Все его колоссальное состояние получит игрок, первым обнаруживший цифровое «пасхальное яйцо», которое миллиардер спрятал где-то на просторах OASISа. Запущенный им квест охватывает весь мир. Совершенно негероический парень по имени Уэйд Уоттс решает принять участие в состязании, с головой бросаясь в головокружительную, искажающую реальность погоню за сокровищами по фантастической вселенной, полной загадок, открытий и опасностей.',	'Тай Шеридан, Оливия Кук, Бен Мендельсон'),
(7,	'Кристофер Робин',	'В жизни повзрослевшего Кристофера Робина царит повседневная рутина. Однажды он встречает друга детства — медвежонка Винни. Вместе им предстоит вернуться в Стоакровый лес, чтобы не только отыскать потерявшихся друзей, но и вновь обрести счастье.',	'Юэн МакГрегор, Хейли Этвелл, Бронте Кармайкл'),
(8,	'Убийца 2. Против всех',	'Обстановка на американо-мексиканской границе накаляется, когда наркокартели начинают переправлять в США террористов. Чтобы дать им отпор федеральный агент Мэтт Грейвер вынужден вновь объединиться с не самым надежным напарником — Алехандро.',	'Бенисио Дель Торо, Джош Бролин, Изабела Монер'),
(9,	'Пылающий',	'Молодой писатель Джонсу встречает старую знакомую, с которой они вместе росли. В ее жизни многое изменилось, и теперь перед ее очарованием сложно устоять. В поисках себя девушка отправляется в Африку и возвращается оттуда с новым другом по имени Бен. Бен — современный Гэтсби, у него нет изъянов, зато есть необычное хобби, узнав о котором, Джонсу лишается покоя.',	'Ю А-ин, Чон Джон-со, Стивен Ян'),
(10,	'Человек-муравей и Оса',	'Скотт Лэнг, известный также как Человек-муравей, уже заслужил право оказаться в команде Мстителей. Но желание быть ближе к дочери удерживает его в родном Сан-Франциско — до тех пор, пока доктор Хэнк Пим, создавший когда-то изменяющий размеры своего владельца чудо-костюм, не призывает Скотта присоединиться к новой опасной миссии. А помогать в противостоянии с коварным врагом Человеку-муравью будет новая напарница — Оса.',	'Пол Радд, Эванджелин Лилли, Майкл Пенья'),
(11,	'Mamma Mia! 2',	'Сбежать на райский греческий остров, чтобы гулять по улочкам очаровательного города, наслаждаться местной кухней, танцевать до утра, кататься на яхте и влюбиться без памяти — что может быть лучше? Звучит, как идеальный план на лето… да и на всю жизнь тоже.',	'Аманда Сайфред, Энди Гарсиа, Селия Имри');

-- 2018-08-28 16:09:55.815134+00
