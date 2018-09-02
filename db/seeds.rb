Center.create!([
  {name: 'Pitampura'},
  {name: 'South Delhi'},
  {name: 'Mehrauli'},
  {name: 'Dwarka'},
  {name: 'East Delhi'},
  {name: 'Faridabad'},
  {name: 'Janakpuri'},
  {name: 'Delhi'},
  {name: 'North Delhi'},
  {name: 'Central Delhi'},
  {name: 'Street-10, Laxmi Nagar'},
  {name: 'Gurgaon'},
  {name: 'Noida'},
  {name: 'Ghaziabad'},
])

## Volunteers
User.create!([
  { name: 'Rushil Agrawal', phone: '9886477775', password: 'asdasdasd', center_id: 1 },
  { name: 'Rohan C', phone: '1234123412', password: 'asdasdasd', center_id: 2 },
])
