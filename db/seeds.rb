require 'faker'

def user_attributes_base
  {
    name: Faker::Name.name,
    sex: rand(1..2),
    email: Faker::Internet.email,
    birth_day: Faker::Date.birthday,
  }
end

100.times do
  User.create(user_attributes_base)
end

100.times do
  teacher_attributes = user_attributes_base.merge(
    {
      educational_background: Faker::University.name,
      vision: Faker::Hipster.sentence,#Faker::StarWars.quote,
      strength: Faker::StarWars.quote,
      is_teacher: true,
    })

  User.create(teacher_attributes)
end
