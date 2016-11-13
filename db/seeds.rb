# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(full_name: 'user1', username: 'user1', email: 'user1@mail.com',password: '123456789', password_confirmation:'123456789')
survey = user.surveys.create(name: 'Survey 1')

questions = Question.create([
                                {text: 'What this?', question_type: 0},
                                {text: 'How you do?', question_type: 1},
                                {text: 'Question?', question_type: 2,
                                 question_options_attributes: [
                                     {text: 'option 1'}, {text: 'option 2'}
                                 ]}
                            ])

survey.questions << questions