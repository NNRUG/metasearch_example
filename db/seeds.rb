# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

items = [{ name: 'T-shirt', description: 'Beautiful t-shirt',
           properties: { color: 'blue', size: 'XL', material: 'cotton' }},
         { name: 'Table', description: 'Good old table',
           properties: { material: 'wood', form: 'square' }}]


Item.create(items)
