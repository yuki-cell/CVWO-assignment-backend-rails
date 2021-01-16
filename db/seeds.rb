# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

task1 = Task.create(name: 'Do math homework (pg.10-12)')
task1.tags.create(name: "important")
task1.tags.create(name: "study")
task2 = Task.create(name: 'Practice piano (30min)')
task2.tags.create(name: "fun")
Task.create(name: 'Continue side project (AI/ML+node.js)')
