
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
   Jumper.create(name: 'Skygod Hansen', license: 'D', description: '',
		phone: '48012441', email: 'test@example.org', verified: 'true',
		nextofkin: 'Lorem Ipsum Dolor sit amet',
		:clubs => Club.where(:name => ['Oslo FSK']),
		:ratings => Rating.where(:name => ['I-1','Demo-1']))
   Jumper.create(name: 'Line Elev', license: 'E', description: '',
		phone: '48012441', email: 'test@example.com', verified: 'true',
		nextofkin: 'Lorem Ipsum Dolor sit amet',
		:clubs => Club.where(:name => ['Nimbus FSK']))
   Jumper.create(name: 'A Line', license: 'E', description: '',
		phone: '48012441', email: 'somewhere@example.org', verified: 'true',
		nextofkin: 'Lorem Ipsum Dolor sit amet',
		:clubs => Club.where(:name => ['Nimbus FSK']))
   Jumper.create(name: 'Lars Kristian Bjerk', license: 'C', description: '',
		phone: '48012441', email: 'somewhere@example.org', verified: 'true',
		nextofkin: 'Lorem Ipsum Dolor sit amet',
		:clubs => Club.where(:name => ['Nimbus FSK']))
   Jumper.create(name: 'Martin Engum', license: 'C', description: '',
		phone: '48012441', email: 'somewhere@example.org', verified: 'true',
		nextofkin: 'Lorem Ipsum Dolor sit amet',
		:clubs => Club.where(:name => ['Nimbus FSK']))

   Load.delete_all
   Load.create(pilot: 'Martin Stene', flighttime: '35', location: 'Rakkestad', loadfortheday: '1', departure_timestamp: Time.now, aircraft: Aircraft.first, created_at: Time.now)

  Price.delete_all
	Price.create(height: '2500', price: '130')
	Price.create(height: '3500', price: '150')
	Price.create(height: '4000', price: '160')
	Price.create(height: '5000', price: '170')
	Price.create(height: '6000', price: '180')
	Price.create(height: '7000', price: '190')
	Price.create(height: '8000', price: '210')
	Price.create(height: '9000', price: '230')
	Price.create(height: '10000', price: '250')

  Slot.delete_all
  @jumpers = Jumper.all
  Slot.create(height: '10000', jumptype: 'Tren', :load => Load.first, :jumper => @jumpers[0], price: '250')
  Slot.create(height: '10000', jumptype: 'Tren', :load => Load.first, :jumper => @jumpers[1], jumpmaster: 'true', price: '200')
  Slot.create(height: '10000', jumptype: 'Tren', :load => Load.first, :jumper => @jumpers[2], price: '250')
  Slot.create(height: '6000', jumptype: 'FF-15', :load => Load.first, :jumper => @jumpers[3], price: '275')
  Slot.create(height: '3500', jumptype: 'UL-T', :load => Load.first, :jumper => @jumpers[4], price: '275')

   puts "Success: Test data loaded"
