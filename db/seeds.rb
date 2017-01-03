# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  [
    {
      name: '五所 和哉',
      gender: false,
      email: 'ketsume0211@gmail.com',
      birth_day: '1993-02-11',

      is_teacher: false,

      educational_background: '一橋大学経済学部',
      vision: '生徒目線',
      strength: '世界史',
      shift_id: 1,
    },
    {
      name: 'Hiroki Nozawa',
      gender: false,
      email: 'example@gmail.com',
      birth_day: '1992-06-06',

      is_teacher: true,

      shift_id: 1,
    },
  ]
)
