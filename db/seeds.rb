# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
file = File.open '/Users/melodysoriano/Flatiron/code/Mod 4/Project/f-wildlife-conservation-backend/db/db.json'
animals = JSON.load(file)['animals']

animals.each do |animal|
    Animal.create(
        name: animal['name'],
        scientific_name: animal['scientific_name'],
        status: animal['status'],
        img_url: animal['img_url'],
        population: animal['population'],
        locations: animal['locations'],
        facts: animal['facts']
    )
end