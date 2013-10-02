# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

curriculum = Curriculum.create({ title: 'Ontario' })
subjects = Subject.create([{ title: 'Math', curriculum: curriculum }, { title: 'Science', curriculum: curriculum }])
strands = Strand.create([{ title: 'Geometry', subject: subjects.first }, { title: 'Something', subject: subjects.second }])
units = Unit.create([{ title: 'Geometry Unit', strand: strands.first, grade: 1 }, { title: 'Something Unit', strand: strands.second, grade: 2 }])