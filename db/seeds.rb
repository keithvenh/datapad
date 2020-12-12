require 'csv'

User.create!(
    username: "Keith",
    email: "keith@datapad.io",
    password: "lukecage2",
    credits: 0,
)

User.create!(
    username: "Zack",
    email: "zack@datapad.io",
    password: "lukecage2",
    credits: 0,
)

User.create!(
    username: "GameMaster",
    email: "gamemaster@datapad.io",
    password: "lukecage2",
    credits: 0,
)

skills = CSV.parse(File.read('db/skills.csv'), headers: true )

skills.each do |row|
    Skill.create(
        name: row['name'],
        attr: row['attribute'],
        description: row['description']
    )
end