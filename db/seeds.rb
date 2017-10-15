# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.create(name: "Alice", email: "alice@wonderland.net", password: "password")
user2 = User.create(name: "Jonny", email: "johnny@gmail.com", password: "password")
user3 = User.create(name: "Clare", email: "claremcdoo@gmail.com", password: "password")

project1 = Project.create(title: "The Doom of Bambabook", description: "The first in a great new fantasy series!", word_goal: 95000, words: 2731, user: user1)
project2 = Project.create(title: "The Wrath of Bambabook", description: "You think it's early to start on the sequel?", word_goal: 115000, words: 2, user: user1)
project3 = Project.create(title: "Pride and Prejudice", description: "What do you mean, it's already been done?", word_goal: 85000, words: 56000, user: user2)
project4 = Project.create(title: "The Scarecrow", description: "A secret projuect I can't talk about!!", word_goal: 60000, words: 12619, user: user3)
project5 = Project.create(title: "Leaves", description: "Short story side project.", word_goal: 3500, words: 860, user: user3)

update1 = ProgressUpdate.create(content: "Vestibulum vel justo quis nunc tempus faucibus ut eget turpis. Donec faucibus ut neque sed molestie. Suspendisse potenti. Suspendisse nulla risus, malesuada cursus eros sed, placerat faucibus mauris. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent elementum rhoncus lectus quis commodo. Sed risus lorem, pretium at convallis id, elementum vitae risus.", words: 257, hours: 1.5, project: project1, user: project1.user)
update2 = ProgressUpdate.create(content: "Quisque felis quam, mollis luctus facilisis placerat, porta at nulla. Proin molestie pretium arcu, ac accumsan nulla ultricies ut. Praesent porta libero eget risus mattis ornare. Proin fermentum ac metus eu ullamcorper.", words: 559, hours: 2.25, project: project1, user: project1.user)
update3 = ProgressUpdate.create(content: "Vestibulum vel justo quis nunc tempus faucibus ut eget turpis.", words: 257, hours: 1.5, project: project2, user: project2.user)
update4 = ProgressUpdate.create(content: "Vestibulum vel justo quis nunc tempus faucibus ut eget turpis.", words: 552, hours: 1.5, project: project2, user: project2.user)
update5 = ProgressUpdate.create(content: "Vestibulum vel justo quis nunc tempus faucibus ut eget turpis.", words: 256, hours: 1, project: project3, user: project3.user)
update6 = ProgressUpdate.create(content: "Vestibulum vel justo quis nunc tempus faucibus ut eget turpis.", project: project4, user: project4.user)

comment1 = Comment.create(content: "Wow, great work!", user: user1, progress_update: update1)
comment2 = Comment.create(content: "Awesome!!!", user: user2, progress_update: update1)
comment3 = Comment.create(content: "I can't believe it!", user: user1, progress_update: update2)