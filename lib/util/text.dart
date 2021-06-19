const List<Map> medkartaHistory = [
  ...medkartaHome,
  ...medkartaAnaliz,
  ...medkartaKlinika
];

const List<Map> medkartaHome = [
  {
    'location': 'На дому',
    'name': 'Иванов Иван Ивнович',
    'speciality': 'Невролог',
    'date': '17 июня 2021',
  },
  {
    'location': 'На дому',
    'name': 'Алексеев Михаил Александрович',
    'speciality': 'Хирург',
    'date': '9 июня 2021',
  },
];

const List<Map> medkartKonsultation = [
  {
    'location': 'На дому',
    'name': 'Иванов Иван Ивнович',
    'speciality': 'Невролог',
    'date': '17 июня 2021',
  },
  {
    'location': 'На дому',
    'name': 'Алексеев Михаил Александрович',
    'speciality': 'Хирург',
    'date': '9 июня 2021',
  },
  {
    'location': 'В клинике',
    'name': 'Михин Алексей Викторович',
    'speciality': 'Хирург',
    'date': '6 июня 2021',
  },
];

const List<Map> medkartaKlinika = [
  {
    'location': 'В клинике',
    'name': 'Михин Алексей Викторович',
    'speciality': 'Хирург',
    'date': '6 июня 2021',
  },
];

const List<Map> medkartaAnaliz = [
  {
    'location': 'Анализы',
    'name': 'Городская поликлиника №3',
    'speciality': 'Анализ мочи',
    'date': '8 июня 2021',
  },
];
const List<String> specialities = [
  'Психиатр',
  'Психолог',
  'Пульманолог',
  'Репродуктолог',
  'Психиатр',
  'Психолог',
  'Психиатр',
  'Психолог',
  'Пульманолог',
  'Репродуктолог',
];
