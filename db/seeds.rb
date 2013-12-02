
   Club.delete_all
   Club.create(name: 'Nimbus FSK', description: 'Rakkestad')
   Club.create(name: 'Oslo FSK', description: 'Østre Æra')

   Rating.delete_all
   Rating.create(name: 'I-3', description: 'Instruktør 3')
   Rating.create(name: 'I-2', description: 'Instruktør 2')
   Rating.create(name: 'I-1', description: 'Instruktør 1')
   Rating.create(name: 'Demo-2', description: 'Demo 2')
   Rating.create(name: 'Demo-1', description: 'Demo 1')

#   Price.delete_all
#   Price.crate(height: '3500', price: '150')

   Aircraft.delete_all
   Aircraft.create(name: 'LN-VYN', aircraft_type: 'Cessna 206', price: '3300',
		capacity: '5')
   Aircraft.create(name: 'LN-PER', aircraft_type: 'Cessna 207', price: '3000',
		capacity: '7')

   Jumper.delete_all
   Jumper.create(name: 'Espen Gundersen', license: 'B', description: '',
		phone: '41930567', email: 'espen11@gmail.com', verified: 'true',
		nextofkin: 'Lorem Ipsum Dolor sit amet', 
		created_at: '1000-01-01 00:00:00', 
		updated_at: '1000-01-01 00:00:01', licensenumber: '113642',
		:clubs => Club.where(:name => ['Nimbus FSK']))
   Jumper.create(name: 'Tommy Botten Jensen', license: 'D', description: '',
		phone: '48012441', email: 'tommybjensen@gmail.com', verified: 'true',
		nextofkin: 'Lorem Ipsum Dolor sit amet',
		:clubs => Club.where(:name => ['Nimbus FSK','Oslo FSK']),
		:ratings => Rating.where(:name => ['I-3','Demo-2']))

   Load.delete_all
   Load.create(pilot: 'Martin Stene', flighttime: '35', location: 'Rakkestad', loadfortheday: '2', departure_timestamp: Time.now, aircraft: Aircraft.first)
   Load.create(pilot: 'Martin Stene', flighttime: '34', location: 'Rakkestad', loadfortheday: '3', departure_timestamp: Time.now, aircraft: Aircraft.first)

  Slot.delete_all
  Slot.create(height: '6000', jumptype: 'Tren', :load => Load.first, :jumper => Jumper.first)
  Slot.create(height: '6000', jumptype: 'Tren', :load => Load.first, :jumper => Jumper.last)
  Slot.create(height: '8000', jumptype: 'Tren', :load => Load.last, :jumper => Jumper.last)

   puts "Success: Test data loaded"
