require 'csv'

# User.create!(
#     username: "Keith",
#     email: "keith@datapad.io",
#     password: "lukecage2",
#     credits: 0,
# )

# User.create!(
#     username: "Zack",
#     email: "zack@datapad.io",
#     password: "lukecage2",
#     credits: 0,
# )

# User.create!(
#     username: "GameMaster",
#     email: "gamemaster@datapad.io",
#     password: "lukecage2",
#     credits: 0,
# )

# skills = CSV.parse(File.read('db/skills.csv'), headers: true )

# skills.each do |row|
#     Skill.create!(
#         name: row['name'],
#         attr: row['attribute'],
#         description: row['description'],
#         type_of: row['type_of']
#     )
# end

# books = CSV.parse(File.read('db/books.csv'), headers: true )

# books.each do |row|
#     Book.create!(
#         game: row['System'],
#         title: row['Title'],
#         subtitle: row['Subtitle'],
#         type_of: row['Type']
#     )
# end

# careers = CSV.parse(File.read('db/careers.csv'), headers: true )

# careers.each do |row|
#     book = Book.where(game: row['Game'], title: 'Core Rulebook').first
#     skills = [
#         Skill.find_by(name: row['Skill1']),
#         Skill.find_by(name: row['Skill2']),
#         Skill.find_by(name: row['Skill3']),
#         Skill.find_by(name: row['Skill4']),
#         Skill.find_by(name: row['Skill5']),
#         Skill.find_by(name: row['Skill6']),
#         Skill.find_by(name: row['Skill7']),
#         Skill.find_by(name: row['Skill8']),
#     ]
#     career = Career.new(
#         name: row['Career'],
#         book: book
#     )
#     career.save!

#     skills.each do |skill|
#         if skill
#             CareerSkill.create!(
#                 career: career,
#                 skill: skill
#             )
#         end
#     end
# end

# specializations = CSV.parse(File.read('db/specializations.csv'), headers: true )

# specializations.each do |row|
#     book = Book.where(game: row['Game'], title: 'Core Rulebook').first
#     career = Career.where(name: row['Career']).first
#     skills = [
#         Skill.find_by(name: row['Skill1']),
#         Skill.find_by(name: row['Skill2']),
#         Skill.find_by(name: row['Skill3']),
#         Skill.find_by(name: row['Skill4'])
#     ]
#     specialization = Specialization.new(
#         name: row['Specialization'],
#         book: book,
#         career: career
#     )
#     specialization.save!

#     skills.each do |skill|
#         if skill
#             SpecializationSkill.create!(
#                 specialization: specialization,
#                 skill: skill
#             )
#         end
#     end
# end

talents = CSV.parse(File.read('db/talents.csv'), headers: true)

talents.each_with_index do |row, index|
    book = Book.where(game: row['Game'], title: 'Core Rulebook').first
    active = false
    activation = row['Activation']
    if activation != "Passive"
        active = true
        puts "#{index} :: " + activation
        if activation != "Active"
            activation = activation.split(' (')
            activation = activation[1].delete_suffix!(')')
            puts "#{index} :: " + activation
        end
    end

end