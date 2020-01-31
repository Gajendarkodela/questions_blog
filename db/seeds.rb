# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# yopmail is used for mailing purpose. you cam go to yopmail.com to check emails.
user_emails = ['gajendar@yopmail.com', 'sam@yopmail.com', 'bharat@yopmail.com', 'soujanya@yopmail.com']

user_emails.each do |email|
  User.create(email: email, password: 'test123', password_confirmation: 'test123')
  p "user #{email} created with password test123"
end

users = User.all
questions = [
  {
    question_name: 'what is bermuda triangle ?',
    answer1: 'Its a suspecious place in the world where many calamities occur',
    answer2: 'It is situated between North and South America.',
    comment: 'good Info'
  },
  {
    question_name: 'How can we motivate ourselves ?',
    answer1: 'By reading Failure stories you can motivate yourself.',
    answer2: 'With the help of Books',
    comment: 'definitely!!'
  },
  {
    question_name: 'How can I move from Hyderabad to Mumbai ?',
    answer1: 'Hyderabad is quite economical than mumbai. You dont need to leave.',
    answer2: 'Prepare your self',
    comment: 'Yes But I got JOb.'
  }
]

User.all.each do |user|
  i = 0
  question_data =  questions[i]
  question = user.questions.create(question_name: question_data[:question_name])
  answer = question.answers.create(description: question_data[:answer1], user_id: users.last.id)
  answer.discussions.create(description: question_data[:comment], user_id: user.id)
  question.answers.create(description: question_data[:answer2], user_id: users[1].id)
  answer.discussions.create(description: "Sorry For that.", user_id: users[2].id)
  i = i+1
end
