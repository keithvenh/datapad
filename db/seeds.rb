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

# skills = CSV.parse(File.read('db/skills.csv', encoding: 'bom|utf-8'), headers: true )

# skills.each do |row|
#     Skill.create!(
#         name: row['name'],
#         attr: row['attribute'],
#         description: row['description'],
#         type_of: row['type_of']
#     )
# end

# books = CSV.parse(File.read('db/books.csv', encoding: 'bom|utf-8'), headers: true )

# books.each do |row|
#     Book.create!(
#         game: row['System'],
#         title: row['Title'],
#         subtitle: row['Subtitle'],
#         type_of: row['Type']
#     )
# end

# careers = CSV.parse(File.read('db/careers.csv', encoding: 'bom|utf-8'), headers: true )

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

# specializations = CSV.parse(File.read('db/specializations.csv', encoding: 'bom|utf-8'), headers: true )

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

# talents = CSV.parse(File.read('db/talents.csv', encoding: 'bom|utf-8'), headers: true)

# talents.each do |row|
#     book = Book.where(game: row['Game'], title: 'Core Rulebook').first
#     active = false
#     activation = row['Activation']
#     if activation != "Passive"
#         active = true
#         if activation != "Active"
#             activation = activation.split(' (')
#             activation = activation[1].delete_suffix!(')')
#         end
#     end

#     row['Force?'] == '1' ? force = true : force = false
#     row['Ranked?'] == '1' ? ranked = true : ranked = false

#     Talent.create!(
#         book: book,
#         name: row['Talent'],
#         active: active,
#         activation_type: activation,
#         shortDesc: row['ShortDesc'],
#         longDesc: row['LongDesc'],
#         force: force,
#         ranked: ranked
#     )
# end

# specialization_talents = CSV.parse(File.read('db/specialization_talents.csv', encoding: 'bom|utf-8'), headers: true)
# specialization_talents.each_with_index do |row, index|

#     specialization = Specialization.find_by(name: row['Specialization'])
#     talent = Talent.find_by(name: row['Talent'])
#     upLink = false
#     downLink = false
#     leftLink = false
#     rightLink = false
#     if row['UpLink'] == '1' then upLink = true end
#     if row['DownLink'] == '1' then downLink = true end
#     if row['LeftLink'] == '1' then leftLink = true end
#     if row['RightLink'] == '1' then rightLink = true end

#     SpecializationTalent.create!(
#         specialization: specialization,
#         talent: talent,
#         row: row['Row'],
#         colStart: row['ColStart'],
#         colSpan: row['ColSpan'],
#         upLink: upLink,
#         downLink: downLink,
#         leftLink: leftLink,
#         rightLink: rightLink,
#         cost: row['Cost']
#     )

# end

force_powers = CSV.parse(File.read('db/force_powers.csv', encoding: 'bom|utf-8'), headers: true)
force_powers.each do |row|
    book = Book.where(game: row['Game'], title: 'Core Rulebook').first
    downLink1 = false
    downLink2 = false
    downLink3 = false
    downLink4 = false
    if row['DownLink1'] == '1' then downLink1 = true end
    if row['DownLink2'] == '1' then downLink2 = true end
    if row['DownLink3'] == '1' then downLink3 = true end
    if row['DownLink4'] == '1' then downLink4 = true end

    ForcePower.create!(
        book: book,
        name: row['Name'],
        force_rating: row['ForceRating'],
        cost: row['Cost'],
        downLink1: downLink1,
        downLink2: downLink2,
        downLink3: downLink3,
        downLink4: downLink4,
        description: row['Description']
    )
end

force_power_upgrades = CSV.parse(File.read('db/force_power_upgrades.csv', encoding: 'bom|utf-8'), headers: true)
force_power_upgrades.each do |row|
    force_power = ForcePower.find_by(name: row['ForcePower'])
    upLink1 = false
    upLink2 = false
    upLink3 = false
    upLink4 = false
    downLink1 = false
    downLink2 = false
    downLink3 = false
    downLink4 = false
    leftLink = false
    rightLink = false
    if row['UpLink1'] == '1' then upLink1 = true end
    if row['UpLink2'] == '1' then upLink2 = true end
    if row['UpLink3'] == '1' then upLink3 = true end
    if row['UpLink4'] == '1' then upLink4 = true end
    if row['DownLink1'] == '1' then downLink1 = true end
    if row['DownLink2'] == '1' then downLink2 = true end
    if row['DownLink3'] == '1' then downLink3 = true end
    if row['DownLink4'] == '1' then downLink4 = true end
    if row['LeftLink'] == '1' then leftLink = true end
    if row['RightLink'] == '1' then rightLink = true end

    ForcePowerUpgrade.create!(
        force_power: force_power,
        name: row['Upgrade'],
        cost: row['Cost'],
        row: row['Row'].to_i,
        colStart: row['ColStart'].to_i,
        colSpan: row['ColSpan'].to_i,
        upLink1: upLink1,
        upLink2: upLink2,
        upLink3: upLink3,
        upLink4: upLink4,
        downLink1: downLink1,
        downLink2: downLink2,
        downLink3: downLink3,
        downLink4: downLink4,
        leftLink: leftLink,
        rightLink: rightLink,
        description: row['Description']
    )

end