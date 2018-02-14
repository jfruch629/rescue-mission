# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

questions = [
  { title: 'Does the apple fall far from the tree?', description: 'I heard that apples do not fall from the tree, but then I feel like they do. Can someone help me out here?' },
  { title: 'Why did the chicken cross the road?', description: 'I know this is a joke, and I am not trying to fool everyone. I am simply wondering, why did someone think of the chicken crossing the road as a joke???' },
  { title: 'What is the number for 911?', description: 'QUICK! Help!! I have an emergency and need to call the police but do not know the number for 911. Can anyone help me?'}
]

questions.each do |question|
  Question.create(question)
end

Question.first.answers << Answer.create({ content: 'The apple has been falling far from the tree as far back as the 1300s.', question_id: Question.first.id})
Question.first.answers << Answer.create({ content: 'I am an experienced apple picker.. In all of my years of picking, I have never seen an apple fall. Then again, I have never see every apple.', question_id: Question.first.id})
Question.second.answers << Answer.create({ content: 'To get to the other side!!!', question_id: Question.second.id})
