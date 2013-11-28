# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
   Club.delete_all
   Club.create(name: 'Nimbus FSK', description: 'Rakkestad')
   Club.create(name: 'Oslo FSK', description: 'Østre Æra')


   Jumper.delete_all
   Jumper.create(name: 'Espen Gundersen', license: 'B', description: 'High guy',
		phone: '41930567', email: 'espen11@gmail.com', verified: 'True',
		nextofkin: 'Atle Gundersen, Far, 92881090')
   Jumper.create(name: 'Tommy Botten Jensen', license: 'EL', description: 'Fat guy',
		phone: '48012441', email: 'tommybjensen@gmail.com', verified: 'True',
		nextofkin: 'Willy Jensen, Far, xxxxxxxx')

   Aircraft.delete_all
   Aircraft.create(name: 'LN-VYN', aircraft_type: 'Cessna 206', price: '3300',
		capacity: '5')
   Aircraft.create(name: 'LN-PER', aircraft_type: 'Cessna 207', price: '3000',
		capacity: '7')


   Rating.delete_all
   Rating.create(name: 'I-3', description: 'Instruktør 3')
   Rating.create(name: 'I-2', description: 'Instruktør 2')
   Rating.create(name: 'I-1', description: 'Instruktør 1')
   Rating.create(name: 'Demo-2', description: 'Demo 2')
   Rating.create(name: 'Demo-1', description: 'Demo 1')
