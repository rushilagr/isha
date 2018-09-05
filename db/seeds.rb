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

## Participants
Participant.create!([
  {first_program_teacher: 'SADHGURU', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "0080359405280270", name: 'RENUKA  TANEJA', pincode: '110058', phone: '9718655300', email: 'ltaneja@ymail.com', occupation: 'TGT', company: 'SKV  ', gender: 'F', dob: Date.current, first_program: 'INNER ENGINEERING 4 DAYS', first_program_date: Date.current, first_program_center: 'DELHI' },
  {first_program_teacher: 'SADHGURU', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "04303594129273199", name: 'Sunil Kumar Gupta', pincode: '110064', phone: '7838556049', email: '', occupation: 'SERVICE', company: 'Tihar Jail', gender: 'M', dob: Date.current, first_program: 'INNER ENGINEERING 3 DAYS ', first_program_date: Date.current, first_program_center: 'DELHI' },
  {first_program_teacher: 'SADHGURU', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "0430359412927219", name: 'Amrita Lal', pincode: '110017', phone: '8004639759', email: 'lalamrita@yahoo.com', occupation: '', company: '', gender: 'F', dob: Date.current, first_program: 'INNER ENGINEERING 3 DAYS ', first_program_date: Date.current, first_program_center: 'DELHI' },
  {first_program_teacher: 'SWAMI NAKSHATRA', shoonya_date: '', bsp_date: Date.current, silence_date: '', hata_yoga_date: '', pid: "0050773418439013", name: 'Mayank Gaur Mr', pincode: '122015', phone: '8130512669', email: 'gaurmayank551@gmail.com', occupation: 'Software Engineer', company: 'TCS', gender: 'M', dob: Date.current, first_program: 'INNER ENGINEERING 7 DAYS', first_program_date: Date.current, first_program_center: 'GURGAON' },
  {first_program_teacher: 'Maa Naanaki', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "0050853416478006", name: 'Anita Sangwan A', pincode: '250001', phone: '8191000006', email: 'anitasangwan69@yahoo.in', occupation: 'Home maker', company: '', gender: '', dob: Date.current, first_program: 'INNER ENGINEERING 7 DAYS', first_program_date: Date.current, first_program_center: 'DELHI-NOIDA' },
  {first_program_teacher: 'SWAMI NAKSHATRA', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "0051064421309010", name: 'DHRUV RINGE', pincode: '201014', phone: '8447682583', email: 'dhruv.ringe@yahoo.com', occupation: 'Working with an NGO', company: '', gender: '', dob: Date.current, first_program: 'INNER ENGINEERING 7 DAYS', first_program_date: Date.current, first_program_center: 'DELHI - CENTRAL DELHI' },
  {first_program_teacher: 'SWAMI NAKSHATRA', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "0050773408849017", name: 'Vishnu Suresh', pincode: '695004', phone: '8527790203', email: 'vishnu418@gmail.com', occupation: 'Trainee', company: 'Reckitt Benckiser', gender: 'M', dob: Date.current, first_program: 'INNER ENGINEERING 7 DAYS', first_program_date: Date.current, first_program_center: 'GURGAON' },
  {first_program_teacher: 'SADHGURU', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "0430359412927357", name: 'ANSHUM PANT', pincode: '110076', phone: '8586868305', email: 'pantanshum@gmail.com', occupation: 'student', company: '', gender: 'M', dob: Date.current, first_program: 'INNER ENGINEERING 3 DAYS ', first_program_date: Date.current, first_program_center: 'DELHI' },
  {first_program_teacher: 'SADHGURU', shoonya_date: '', bsp_date: '', silence_date: Date.current, hata_yoga_date: '', pid: "0080359405287114", name: 'KUMAR KRISHAN', pincode: '110075', phone: '8800219549', email: 'krishan@hpcl.co.in', occupation: 'MANAGER - HR', company: 'HPCL', gender: 'M', dob: Date.current, first_program: 'INNER ENGINEERING 4 DAYS', first_program_date: Date.current, first_program_center: 'DELHI' },
  {first_program_teacher: 'SADHGURU', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "04303594129271876", name: 'NITESH MURTI', pincode: '110067', phone: '8800347674', email: 'niteshmurti@gmail.com', occupation: 'VICE PRESIDENT - BUSINESS', company: 'WHATS UP BHARAT', gender: 'M', dob: Date.current, first_program: 'INNER ENGINEERING 3 DAYS ', first_program_date: Date.current, first_program_center: 'DELHI' },
  {first_program_teacher: 'SADHGURU', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "0430359412927222", name: 'Amritesh Singhania', pincode: '768201', phone: '8802401734', email: 'amriteshsinghania@gmail.com', occupation: 'job', company: 'Evaluserve.com', gender: 'M', dob: Date.current, first_program: 'INNER ENGINEERING 3 DAYS ', first_program_date: Date.current, first_program_center: 'DELHI' },
  {first_program_teacher: 'SADHGURU', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "0080359405280380", name: 'VIBHA SACHDEV', pincode: '110018', phone: '8826331092', email: 'vibha.sdev@gmail.com', occupation: 'FREELANCE DESIGNER', company: '', gender: 'F', dob: Date.current, first_program: 'INNER ENGINEERING 4 DAYS', first_program_date: Date.current, first_program_center: 'DELHI' },
  {first_program_teacher: 'SADHGURU', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "04303594129273328", name: 'Toshi Sarin', pincode: '110022', phone: '8826865448', email: 'ashishmagoo92@gmail.com', occupation: '', company: '', gender: 'F', dob: Date.current, first_program: 'INNER ENGINEERING 3 DAYS ', first_program_date: Date.current, first_program_center: 'DELHI' },
  {first_program_teacher: 'SUE', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "0050047394517016", name: 'RAJAGOPAL.N', pincode: '610201', phone: '8860531110', email: 'pnrgopal@gmail.com', occupation: 'SR SCIENTIST', company: '', gender: 'M', dob: Date.current, first_program: 'INNER ENGINEERING 7 DAYS', first_program_date: Date.current, first_program_center: 'NEW DELHI' },
])

## Raw parsed users
# {first_teacher: 'SADHGURU', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "0080359405280270", name: 'RENUKA  TANEJA', pincode: '110058', center: 'West Delhi', phone: '9718655300', email: 'ltaneja@ymail.com', occupation: 'TGT', company: 'SKV  ', gender: 'F', dob: '0000-00-00', first_program: 'INNER ENGINEERING 4 DAYS', first_program_date: '16.12.2010', first_program_center: 'DELHI' },
# {first_teacher: 'SADHGURU', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "04303594129273199", name: 'Sunil Kumar Gupta', pincode: '110064', center: 'West Delhi', phone: '7838556049', email: '', occupation: 'SERVICE', company: 'Tihar Jail', gender: 'M', dob: '0000-00-00', first_program: 'INNER ENGINEERING 3 DAYS ', first_program_date: '18.01.2013', first_program_center: 'DELHI' },
# {first_teacher: 'SADHGURU', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "0430359412927219", name: 'Amrita Lal', pincode: '110017', center: 'Central Delhi', phone: '8004639759', email: 'lalamrita@yahoo.com', occupation: '', company: '', gender: 'F', dob: '0000-00-00', first_program: 'INNER ENGINEERING 3 DAYS ', first_program_date: '18.01.2013', first_program_center: 'DELHI' },
# {first_teacher: 'SWAMI NAKSHATRA', shoonya_date: '', bsp_date: '26/12/2015 , silence_date: '', hata_yoga_date: '', pid: "0050773418439013", name: 'Mayank Gaur Mr', pincode: '122015', center: 'Gurgaon', phone: '8130512669', email: 'gaurmayank551@gmail.com', occupation: 'Software Engineer', company: 'TCS', gender: 'M', dob: '19.09.1990', first_program: 'INNER ENGINEERING 7 DAYS', first_program_date: '23.07.2014', first_program_center: 'GURGAON' },
# {first_teacher: 'Maa Naanaki', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "0050853416478006", name: 'Anita Sangwan A', pincode: '250001', center: 'Uttar Pradesh', phone: '8191000006', email: 'anitasangwan69@yahoo.in', occupation: 'Home maker', company: '', gender: '', dob: '06.09.1977', first_program: 'INNER ENGINEERING 7 DAYS', first_program_date: '08.01.2014', first_program_center: 'DELHI-NOIDA' },
# {first_teacher: 'SWAMI NAKSHATRA', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "0051064421309010", name: 'DHRUV RINGE', pincode: '201014', center: 'East Delhi', phone: '8447682583', email: 'dhruv.ringe@yahoo.com', occupation: 'Working with an NGO', company: '', gender: '', dob: '10.03.1990', first_program: 'INNER ENGINEERING 7 DAYS', first_program_date: '06.05.2015', first_program_center: 'DELHI - CENTRAL DELHI' },
# {first_teacher: 'SWAMI NAKSHATRA', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "0050773408849017", name: 'Vishnu Suresh', pincode: '695004', center: 'Kerala', phone: '8527790203', email: 'vishnu418@gmail.com', occupation: 'Trainee', company: 'Reckitt Benckiser', gender: 'M', dob: '22.09.1987', first_program: 'INNER ENGINEERING 7 DAYS', first_program_date: '07.12.2011', first_program_center: 'GURGAON' },
# {first_teacher: 'SADHGURU', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "0430359412927357", name: 'ANSHUM PANT', pincode: '110076', center: 'Central Delhi', phone: '8586868305', email: 'pantanshum@gmail.com', occupation: 'student', company: '', gender: 'M', dob: '0000-00-00', first_program: 'INNER ENGINEERING 3 DAYS ', first_program_date: '18.01.2013', first_program_center: 'DELHI' },
# {first_teacher: 'SADHGURU', shoonya_date: '', bsp_date: '', silence_date: '26/02/2009 , ', hata_yoga_date: '', pid: "0080359405287114", name: 'KUMAR KRISHAN', pincode: '110075', center: 'Dwarka', phone: '8800219549', email: 'krishan@hpcl.co.in', occupation: 'MANAGER - HR', company: 'HPCL', gender: 'M', dob: '0000-00-00', first_program: 'INNER ENGINEERING 4 DAYS', first_program_date: '16.12.2010', first_program_center: 'DELHI' },
# {first_teacher: 'SADHGURU', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "04303594129271876", name: 'NITESH MURTI', pincode: '110067', center: 'South Delhi', phone: '8800347674', email: 'niteshmurti@gmail.com', occupation: 'VICE PRESIDENT - BUSINESS', company: 'WHATS UP BHARAT', gender: 'M', dob: '0000-00-00', first_program: 'INNER ENGINEERING 3 DAYS ', first_program_date: '18.01.2013', first_program_center: 'DELHI' },
# {first_teacher: 'SADHGURU', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "0430359412927222", name: 'Amritesh Singhania', pincode: '768201', center: 'Odisha', phone: '8802401734', email: 'amriteshsinghania@gmail.com', occupation: 'job', company: 'Evaluserve.com', gender: 'M', dob: '0000-00-00', first_program: 'INNER ENGINEERING 3 DAYS ', first_program_date: '18.01.2013', first_program_center: 'DELHI' },
# {first_teacher: 'SADHGURU', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "0080359405280380", name: 'VIBHA SACHDEV', pincode: '110018', center: 'West Delhi', phone: '8826331092', email: 'vibha.sdev@gmail.com', occupation: 'FREELANCE DESIGNER', company: '', gender: 'F', dob: '0000-00-00', first_program: 'INNER ENGINEERING 4 DAYS', first_program_date: '16.12.2010', first_program_center: 'DELHI' },
# {first_teacher: 'SADHGURU', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "04303594129273328", name: 'Toshi Sarin', pincode: '110022', center: 'South Delhi', phone: '8826865448', email: 'ashishmagoo92@gmail.com', occupation: '', company: '', gender: 'F', dob: '0000-00-00', first_program: 'INNER ENGINEERING 3 DAYS ', first_program_date: '18.01.2013', first_program_center: 'DELHI' },
# {first_teacher: 'SUE', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "0050047394517016", name: 'RAJAGOPAL.N', pincode: '610201', center: 'Tamil Nadu', phone: '8860531110', email: 'pnrgopal@gmail.com', occupation: 'SR SCIENTIST', company: '', gender: 'M', dob: '0000-00-00', first_program: 'INNER ENGINEERING 7 DAYS', first_program_date: '04.01.2008', first_program_center: 'NEW DELHI' },
