# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Character.create([

	{ name: "Neo", descriptions: 'Hacker
    The One, an anagram for Neo (warrior)
    Former software engineer (in the Matrix simulation)' },
	{ name: "Trinity", descriptions: "First Mate of the Nebuchadnezzar, Neo's Lover" },
	{ name: "Morpheus", descriptions: 'Captain of the Nebuchadnezzar' },
	{ name: "Agent Smith", descriptions: 'Smith, an AI in human form is one of the three Agents sent to deal with Morpheus'},

])

Vehicle.create([

	{ name: "Nebuchadnezzar", style: "Spaceship" }
])