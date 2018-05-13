City.create([
  {name: 'Delhi'},
  {name: 'Noida'},
  {name: 'Gurgaon'},
  {name: 'Mumbai1'},
])

Center.create([
  {city_id: 2, name: 'Greater Noida'},
  {city_id: 1, name: 'South Delhi'},
])

## Volunteers
User.create([
  { name: 'Rushil Agrawal', phone: '9886477775', city_id: 1, password: 'asdasdasd' },
  { name: 'Rohan C', phone: '1234123412', city_id: 1, password: 'asdasdasd' },
])

Program.create([
  {type: 'Inner Engineering 7 days', starts_at: Date.today, ends_at: Date.current, center_id: 1, user_id: 1},
  {type: 'Inner Engineering 7 days', starts_at: Date.today, ends_at: Date.current, center_id: 1, user_id: 1},
])

Participant.create([
  {name: 'Homo Sapien', phone: '1234123412', email: 'Sapien@email.com', pincode: '111111', gender: 'Male', occupation: 'Hunter', city_id: 1, program_participants_attributes: [{program_id: 1, status: 'ongoing'}]},
  {name: 'Homo Erectus', phone: '1234123411', email: 'Erectus@email.com', pincode: '111111', gender: 'Male', occupation: 'Hunter', city_id: 1, program_participants_attributes: [{program_id: 1, status: 'ongoing'}]},
  {name: 'Neander Thal', phone: '1234123413', email: 'Thal@email.com', pincode: '111111', gender: 'Male', occupation: 'Hunter', city_id: 1, program_participants_attributes: [{program_id: 1, status: 'ongoing'}]},
  {name: 'Homo Aryan', phone: '1234123414', email: 'Aryan@email.com', pincode: '111111', gender: 'Male', occupation: 'Hunter', city_id: 1, program_participants_attributes: [{program_id: 1, status: 'ongoing'}]},
  {name: 'Homo Dravidian', phone: '1234123415', email: 'Dravidian@email.com', pincode: '111111', gender: 'Male', occupation: 'Hunter', city_id: 1, program_participants_attributes: [{program_id: 1, status: 'ongoing'}]},
])

TempParticipant.create([
  {name: 'Rushil', phone: '+911234123412', email: 'rushil@email .com', pincode: '111111', gender: 'Male', city: 'Dilli', program_id: Program.first.id},
  {name: 'Rohan', phone: 'No number', email: 'rohan@gmail', pincode: '111111', gender: 'Female', city: 'Assam', program_id: Program.first.id},
  {name: 'Utkarsh', phone: '+911234123412', email: 'ut@gmail.com', pincode: '111111', gender: 'Female', city: City.first.name, program_id: Program.first.id},
])
