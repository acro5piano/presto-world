# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Teacher.create(
  [
    {
      name: '五所 和哉',
      age: 23,
      educational_background: '一橋大学経済学部',
      vision: '生徒目線',
      strength: '世界史',
      shift_id: 1,
    },

  ]
)
