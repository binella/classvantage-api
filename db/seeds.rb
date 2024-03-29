#-------------------------------------------
#
# OAuth Angular App
#
#-------------------------------------------
app = Doorkeeper::Application.create(:name => 'angular', :redirect_uri => 'http://test.classvantage.com')
app.uid = "20100c70466699968233062227f148840238540ecf511a92e8d5d6748f0149de"
app.secret = "9a13e2fd0a71494c87681b462213d416a3b8b503ca6ed13690bfe3de4ce0ee29"
app.save

#-------------------------------------------
#
# Users
#
#-------------------------------------------

User.create :email => 'walter@white.com', :password => 'lkj123poiasd'
User.create :email => 'sean@king.st', :password => 'password'
User.create :email => 'tephen@king.st', :password => 'password'
User.create :email => 'ryan@classvantage.com', :password => 'password'
User.create :email => 'steve@classvantage.com', :password => 'password'
User.create :email => 'nicole@classvantage.com', :password => 'password'
User.create :email => 'jared@classvantage.com', :password => 'password'

#-------------------------------------------------------------------------------
#
#  Ontario
#
#-------------------------------------------------------------------------------

ontario = Curriculum.create({ title: "Ontario" })

arts         = Subject.create({ title: "The Arts",                      curriculum: ontario })
french       = Subject.create({ title: "French As a Second Language",   curriculum: ontario })
health       = Subject.create({ title: "Health and Physical Education", curriculum: ontario })
# kindergarten = Subject.create({ title: "The Kindergarten Program",      curriculum: ontario })
language     = Subject.create({ title: "Language",                      curriculum: ontario })
math         = Subject.create({ title: "Mathematics",                   curriculum: ontario })
native       = Subject.create({ title: "Native Languages",              curriculum: ontario })
science      = Subject.create({ title: "Science and Technology",        curriculum: ontario })
social       = Subject.create({ title: "Social Studies",                curriculum: ontario })
histogeo     = Subject.create({ title: "History and Geography",         curriculum: ontario })

#---------------------------------------
#  The Arts
#---------------------------------------

dance  = Strand.create({ title: "Dance",       subject: arts })
drama  = Strand.create({ title: "Drama",       subject: arts })
music  = Strand.create({ title: "Music",       subject: arts })
visual = Strand.create({ title: "Visual Arts", subject: arts })

(1..8).each do |n|
  Unit.create([
    { strand: dance, grade: n },
    { strand: drama, grade: n },
    { strand: music, grade: n },
    { strand: visual, grade: n }
  ])
end


#---------------------------------------
#  French As a Second Language
#---------------------------------------

listening = Strand.create({ title: "Listening", subject: french })
speaking  = Strand.create({ title: "Speaking",  subject: french })
reading   = Strand.create({ title: "Reading",   subject: french })
writing   = Strand.create({ title: "Writing",   subject: french })

(4..8).each do |n|
  Unit.create([
    { title: "Listening (Core)", strand: listening, grade: n },
    { title: "Speaking (Core)",  strand: speaking, grade: n },
    { title: "Reading (Core)",   strand: reading, grade: n },
    { title: "Writing (Core)",   strand: writing, grade: n }
  ])
end

(4..8).each do |n|
  Unit.create([
    { title: "Listening (Extended)", strand: listening, grade: n },
    { title: "Speaking (Extended)",  strand: speaking, grade: n },
    { title: "Reading (Extended)",   strand: reading, grade: n },
    { title: "Writing (Extended)",   strand: writing, grade: n }
  ])
end

(1..8).each do |n|
  Unit.create([
    { title: "Listening (Immersion)", strand: listening, grade: n },
    { title: "Speaking (Immersion)",  strand: speaking, grade: n },
    { title: "Reading (Immersion)",   strand: reading, grade: n },
    { title: "Writing (Immersion)",   strand: writing, grade: n }
  ])
end

#---------------------------------------
#  Health and Physical Education
#---------------------------------------

living   = Strand.create({ title: "Living Skills",       subject: health })
active   = Strand.create({ title: "Active Living",       subject: health })
movement = Strand.create({ title: "Movement Competence", subject: health })
healthy  = Strand.create({ title: "Healthy Living",      subject: health })

(1..8).each do |n|
  Unit.create([
    { strand: living,   grade: n },
    { strand: active,   grade: n },
    { strand: movement, grade: n },
    { strand: healthy,  grade: n }
  ])
end

#---------------------------------------
#  Language
#---------------------------------------

oral    = Strand.create({ title: "Oral Communication", subject: language })
reading = Strand.create({ title: "Reading",            subject: language })
writing = Strand.create({ title: "Writing",            subject: language })
media   = Strand.create({ title: "Media Literacy",     subject: language })

(1..8).each do |n|
  Unit.create([
    { strand: oral,    grade: n },
    { strand: reading, grade: n },
    { strand: writing, grade: n },
    { strand: media,   grade: n }
  ])
end

#---------------------------------------
#  Mathematics
#---------------------------------------

number      = Strand.create({ title: "Number Sense and Numeration",     subject: math })
measurement = Strand.create({ title: "Measurement",                     subject: math })
geometry    = Strand.create({ title: "Geometry and Spatial Sense",      subject: math })
patterning  = Strand.create({ title: "Patterning and Algebra",          subject: math })
data        = Strand.create({ title: "Data Management and Probability", subject: math })

(1..8).each do |n|
  Unit.create([
    { strand: number,      grade: n },
    { strand: measurement, grade: n },
    { strand: geometry,    grade: n },
    { strand: patterning,  grade: n },
    { strand: data,        grade: n }
  ])
end

#---------------------------------------
#  Native Languages
#---------------------------------------

oral    = Strand.create({ title: "Oral Communication", subject: native })
reading = Strand.create({ title: "Reading",            subject: native })
writing = Strand.create({ title: "Writing",            subject: native })

(1..8).each do |n|
  Unit.create([
    { strand: oral,    grade: n },
    { strand: reading, grade: n },
    { strand: writing, grade: n }
  ])
end

#---------------------------------------
#  Science and Technology
#---------------------------------------

life       = Strand.create({ title: "Understanding Life Systems",              subject: science })
structures = Strand.create({ title: "Understanding Structures and Mechanisms", subject: science })
matter     = Strand.create({ title: "Understanding Matter and Energy",         subject: science })
earth      = Strand.create({ title: "Understanding Earth and Space Systems",   subject: science })

Unit.create({ title: "Needs and Characteristics of Living Things", strand: life, grade: 1 })
Unit.create({ title: "Growth and Changes in Animals",              strand: life, grade: 2 })
Unit.create({ title: "Growth and Changes in Plants",               strand: life, grade: 3 })
Unit.create({ title: "Habitats and Communities",                   strand: life, grade: 4 })
Unit.create({ title: "Human Organ Systems",                        strand: life, grade: 5 })
Unit.create({ title: "Biodiversity",                               strand: life, grade: 6 })
Unit.create({ title: "Interactions in the Environment",            strand: life, grade: 7 })
Unit.create({ title: "Cells",                                      strand: life, grade: 8 })

Unit.create({ title: "Materials, Objects, and Everyday Structures", strand: structures, grade: 1 })
Unit.create({ title: "Movement",                                    strand: structures, grade: 2 })
Unit.create({ title: "Strong and Stable Structures",                strand: structures, grade: 3 })
Unit.create({ title: "Pulleys and Gears",                           strand: structures, grade: 4 })
Unit.create({ title: "Forces Acting on Structures and Mechanisms",  strand: structures, grade: 5 })
Unit.create({ title: "Flight",                                      strand: structures, grade: 6 })
Unit.create({ title: "Form and Function",                           strand: structures, grade: 7 })
Unit.create({ title: "Systems in Action",                           strand: structures, grade: 8 })

Unit.create({ title: "Energy in Our Lives",                 strand: matter, grade: 1 })
Unit.create({ title: "Properties of Liquids and Solids",    strand: matter, grade: 2 })
Unit.create({ title: "Forces Causing Movement",             strand: matter, grade: 3 })
Unit.create({ title: "Light and Sound",                     strand: matter, grade: 4 })
Unit.create({ title: "Properties of and Changes in Matter", strand: matter, grade: 5 })
Unit.create({ title: "Electricity and Electrical Devices",  strand: matter, grade: 6 })
Unit.create({ title: "Pure Substances and Mixtures",        strand: matter, grade: 7 })
Unit.create({ title: "Fluids",                              strand: matter, grade: 8 })

Unit.create({ title: "Daily and Seasonal Changes",           strand: earth, grade: 1 })
Unit.create({ title: "Air and Water in the Environment",     strand: earth, grade: 2 })
Unit.create({ title: "Soils in the Environment",             strand: earth, grade: 3 })
Unit.create({ title: "Rocks and Minerals",                   strand: earth, grade: 4 })
Unit.create({ title: "Conservation of Energy and Resources", strand: earth, grade: 5 })
Unit.create({ title: "Space",                                strand: earth, grade: 6 })
Unit.create({ title: "Heat in the Environment",              strand: earth, grade: 7 })
Unit.create({ title: "Water Systems",                        strand: earth, grade: 8 })

#---------------------------------------
#  Social Studies
#---------------------------------------

heritage = Strand.create({ title: "Heritage and Identity",     subject: social })
canada   = Strand.create({ title: "People and Environments", subject: social })

Unit.create({ title: "Our Changing Roles and Responsibilities",  strand: heritage, grade: 1 })
Unit.create({ title: "Changing Family and Community Traditions",                 strand: heritage, grade: 2 })
Unit.create({ title: "Communities in Canada 1780-1850",           strand: heritage, grade: 3 })
Unit.create({ title: "Early Societies, 3000 BCE - 1500 CE",                              strand: heritage, grade: 4 })
Unit.create({ title: "First Nation and Europeans in New France and Early Canada",                         strand: heritage, grade: 5 })
Unit.create({ title: "Communities in Canada, Past and Present", strand: heritage, grade: 6 })

Unit.create({ title: "The Local Community",                             strand: canada,   grade: 1 })
Unit.create({ title: "Global Communities",        strand: canada,   grade: 2 })
Unit.create({ title: "Living and Working in Ontario",                     strand: canada,   grade: 3 })
Unit.create({ title: "Political and Physical Regions of Canada",     strand: canada,   grade: 4 })
Unit.create({ title: "The Role of Government and Responsible Citizenship", strand: canada,   grade: 5 })
Unit.create({ title: "Canada's Interaction with the Global Community",                     strand: canada,   grade: 6 })

#---------------------------------------
#  History and Geography
#---------------------------------------
history   = Strand.create({ title: "History",   subject: histogeo })
geography = Strand.create({ title: "Geography", subject: histogeo })

Unit.create({ title: "New France and British North America, 1713–1800",                        strand: history,   grade: 7 })
#Unit.create({ title: "British North America",             strand: history,   grade: 7 })
Unit.create({ title: "Canada, 1800–1850: Conflict and Challenges",                strand: history,   grade: 7 })
#Unit.create({ title: "Confederation",                     strand: history,   grade: 8 })
Unit.create({ title: "Creating Canada, 1850–1890", strand: history,   grade: 8 })
Unit.create({ title: "Canada, 1890–1914: A Changing Society",        strand: history,   grade: 8 })

#Unit.create({ title: "The Themes of Geographic Inquiry", strand: geography, grade: 7 })
Unit.create({ title: "Physical Patterns in a Changing World",   strand: geography, grade: 7 })
Unit.create({ title: "Natural Resources Around the World: Use and Sustainability",                strand: geography, grade: 7 })
Unit.create({ title: "Global Settlement: Patterns and Sustainability",     strand: geography, grade: 8 })
Unit.create({ title: "Global Inequalities: Economic Development and Quality of Life",                 strand: geography, grade: 8 })
#Unit.create({ title: "Migration",                        strand: geography, grade: 8 })
