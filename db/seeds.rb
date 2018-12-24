case Rails.env

when 'production'
  User.create!([
    { name: 'Rushil Agrawal', phone: '9886477775', password: 'asdasdasd', center_id: Center.find_by(name: 'South Delhi').id, role: 'admin' },
    { name: 'Rohan Choudury', phone: '8826967297', password: 'asdasdasd', center_id: Center.find_by(name: 'South Delhi').id, role: 'admin' },
  ])


else
  Circle.create!([
    { coordinator: 'Maa Madhuchandra, Vinodhini Akka', name: 'Delhi'},
  ])

  Sector.create!([
    { circle_id: 1, coordinator: 'Arundhati', name: 'Cenral_And_South'},
    { circle_id: 1, coordinator: 'Sandeep', name: 'EastDelhi_AND_UP'},
  ])

  Center.create!([
    { sector_id: 1, coordinator: 'Sagarika', name: 'Pitampura'},
    { sector_id: 1, coordinator: 'Sagarika', name: 'South Delhi'},
    { sector_id: 1, coordinator: 'Sagarika', name: 'Mehrauli'},
    { sector_id: 2, coordinator: '', name: 'Dwarka'},
    { sector_id: 2, coordinator: '', name: 'East Delhi'},
    { sector_id: 1, coordinator: 'Sagarika', name: 'Faridabad'},
    { sector_id: 1, coordinator: 'Sagarika', name: 'Janakpuri'},
    { sector_id: 1, coordinator: 'Sagarika', name: 'Delhi'},
    { sector_id: 1, coordinator: 'Sagarika', name: 'North Delhi'},
    { sector_id: 1, coordinator: 'Sagarika', name: 'Central Delhi'},
    { sector_id: 1, coordinator: 'Sagarika', name: 'Street-10, Laxmi Nagar'},
    { sector_id: 1, coordinator: 'Sagarika', name: 'Gurgaon'},
    { sector_id: 1, coordinator: 'Sagarika', name: 'Noida'},
    { sector_id: 1, coordinator: 'Sagarika', name: 'Ghaziabad'},
  ])

  PinCode.create!([
    { string: '110025', state: 'DELHI', lat: 25.5, lng: 12.5, center_id: 1 },
    { string: '110027', state: 'DELHI', lat: 25.5, lng: 12.5, center_id: 1 },
    { string: '110028', state: 'DELHI', lat: 25.5, lng: 12.5, center_id: 1 },
    { string: '110029', state: 'DELHI', lat: 25.5, lng: 12.5, center_id: 1 },
  ])
  CreateDefaultPinCodes.all_defaults

  ## Volunteers
  User.create!([
    { name: 'Rushil Agrawal', phone: '9886477775', password: 'asdasdasd', center_id: 1, role: 'admin' },
    { name: 'Rohan C', phone: '1111111111', password: 'asdasdasd', center_id: 2, role: 'coordinator' },
    { name: 'Bhushan', phone: '2222222222', password: 'asdasdasd', center_id: 3, role: 'volunteer' },
  ])

  def date_rand
    rand(1..100).days.ago.to_date
  end

  Participant.create!([
    {i_e_teacher: 'SADHGURU', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "0080359405280270", name: 'RENUKA  TANEJA', pin_code_id: 1, phone: '9718655300', email: 'ltaneja@ymail.com', occupation: 'TGT', company: 'SKV  ', gender: 'F', dob: date_rand, i_e_program_type: 'INNER ENGINEERING 4 DAYS', i_e_date: date_rand, i_e_center: 'DELHI' },
    {i_e_teacher: 'SADHGURU', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "04303594129273199", name: 'Sunil Kumar Gupta', pin_code_id: 2, phone: '7838556049', email: '', occupation: 'SERVICE', company: 'Tihar Jail', gender: 'M', dob: date_rand, i_e_program_type: 'INNER ENGINEERING 3 DAYS ', i_e_date: date_rand, i_e_center: 'DELHI' },
    {i_e_teacher: 'SADHGURU', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "0430359412927219", name: 'Amrita Lal', pin_code_id: 2, phone: '8004639759', email: 'lalamrita@yahoo.com', occupation: '', company: '', gender: 'F', dob: date_rand, i_e_program_type: 'INNER ENGINEERING 3 DAYS ', i_e_date: date_rand, i_e_center: 'DELHI' },
    {i_e_teacher: 'SWAMI NAKSHATRA', shoonya_date: '', bsp_date: date_rand, silence_date: '', hata_yoga_date: '', pid: "0050773418439013", name: 'Mayank Gaur Mr', pin_code_id: 2, phone: '8130512669', email: 'gaurmayank551@gmail.com', occupation: 'Software Engineer', company: 'TCS', gender: 'M', dob: date_rand, i_e_program_type: 'INNER ENGINEERING 7 DAYS', i_e_date: date_rand, i_e_center: 'GURGAON' },
    {i_e_teacher: 'Maa Naanaki', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "0050853416478006", name: 'Anita Sangwan A', pin_code_id: 1, phone: '8191000006', email: 'anitasangwan69@yahoo.in', occupation: 'Home maker', company: '', gender: '', dob: date_rand, i_e_program_type: 'INNER ENGINEERING 7 DAYS', i_e_date: date_rand, i_e_center: 'DELHI-NOIDA' },
    {i_e_teacher: 'SWAMI NAKSHATRA', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "0051064421309010", name: 'DHRUV RINGE', pin_code_id: 1, phone: '8447682583', email: 'dhruv.ringe@yahoo.com', occupation: 'Working with an NGO', company: '', gender: '', dob: date_rand, i_e_program_type: 'INNER ENGINEERING 7 DAYS', i_e_date: date_rand, i_e_center: 'DELHI - CENTRAL DELHI' },
    {i_e_teacher: 'SWAMI NAKSHATRA', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "0050773408849017", name: 'Vishnu Suresh', pin_code_id: 1, phone: '8527790203', email: 'vishnu418@gmail.com', occupation: 'Trainee', company: 'Reckitt Benckiser', gender: 'M', dob: date_rand, i_e_program_type: 'INNER ENGINEERING 7 DAYS', i_e_date: date_rand, i_e_center: 'GURGAON' },
    {i_e_teacher: 'SADHGURU', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "0430359412927357", name: 'ANSHUM PANT', pin_code_id: 3, phone: '8586868305', email: 'pantanshum@gmail.com', occupation: 'student', company: '', gender: 'M', dob: date_rand, i_e_program_type: 'INNER ENGINEERING 3 DAYS ', i_e_date: date_rand, i_e_center: 'DELHI' },
    {i_e_teacher: 'SADHGURU', shoonya_date: '', bsp_date: '', silence_date: date_rand, hata_yoga_date: '', pid: "0080359405287114", name: 'KUMAR KRISHAN', pin_code_id: 3, phone: '8800219549', email: 'krishan@hpcl.co.in', occupation: 'MANAGER - HR', company: 'HPCL', gender: 'M', dob: date_rand, i_e_program_type: 'INNER ENGINEERING 4 DAYS', i_e_date: date_rand, i_e_center: 'DELHI' },
    {i_e_teacher: 'SADHGURU', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "04303594129271876", name: 'NITESH MURTI', pin_code_id: 3, phone: '8800347674', email: 'niteshmurti@gmail.com', occupation: 'VICE PRESIDENT - BUSINESS', company: 'WHATS UP BHARAT', gender: 'M', dob: date_rand, i_e_program_type: 'INNER ENGINEERING 3 DAYS ', i_e_date: date_rand, i_e_center: 'DELHI' },
    {i_e_teacher: 'SADHGURU', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "0430359412927222", name: 'Amritesh Singhania', pin_code_id: 1, phone: '8802401734', email: 'amriteshsinghania@gmail.com', occupation: 'job', company: 'Evaluserve.com', gender: 'M', dob: date_rand, i_e_program_type: 'INNER ENGINEERING 3 DAYS ', i_e_date: date_rand, i_e_center: 'DELHI' },
    {i_e_teacher: 'SADHGURU', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "0080359405280380", name: 'VIBHA SACHDEV', pin_code_id: 1, phone: '8826331092', email: 'vibha.sdev@gmail.com', occupation: 'FREELANCE DESIGNER', company: '', gender: 'F', dob: date_rand, i_e_program_type: 'INNER ENGINEERING 4 DAYS', i_e_date: date_rand, i_e_center: 'DELHI' },
    {i_e_teacher: 'SADHGURU', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "04303594129273328", name: 'Toshi Sarin', pin_code_id: 4, phone: '8826865448', email: 'ashishmagoo92@gmail.com', occupation: '', company: '', gender: 'F', dob: date_rand, i_e_program_type: 'INNER ENGINEERING 3 DAYS ', i_e_date: date_rand, i_e_center: 'DELHI' },
    {i_e_teacher: 'SUE', shoonya_date: '', bsp_date: '', silence_date: '', hata_yoga_date: '', pid: "0050047394517016", name: 'RAJAGOPAL.N', pin_code_id: 3, phone: '8860531110', email: 'pnrgopal@gmail.com', occupation: 'SR SCIENTIST', company: '', gender: 'M', dob: date_rand, i_e_program_type: 'INNER ENGINEERING 7 DAYS', i_e_date: date_rand, i_e_center: 'NEW DELHI' },
  ])

  CallTask.create!([
    { name: 'YnT JNT (No calling happening)', script: 'this is script', creator_id: User.first.id, max_calls_per_caller: 3, participants_confirmed: true, callers_confirmed: true, confirmed: true },
    { name: 'YnT 2', script: 'this is script', creator_id: User.first.id, max_calls_per_caller: 3, participants_confirmed: true, callers_confirmed: true, confirmed: true },
  ])

  CallTaskCaller.create!([
    { call_task_id: CallTask.first.id, caller_id: User.last.id },
    { call_task_id: CallTask.second.id, caller_id: User.last.id },
  ])

  participants = Participant.all.to_a
  CallTaskParticipant.create!([
    { call_task_id: CallTask.first.id, participant_id: participants.pop.id },
    { call_task_id: CallTask.first.id, participant_id: participants.pop.id },
    { call_task_id: CallTask.first.id, participant_id: participants.pop.id },
    { call_task_id: CallTask.first.id, participant_id: participants.pop.id },
    { call_task_id: CallTask.first.id, participant_id: participants.pop.id },
    { call_task_id: CallTask.first.id, participant_id: participants.pop.id },

    { call_task_id: CallTask.second.id, participant_id: participants.pop.id, call_task_caller_id: CallTaskCaller.second.id, status: CallTaskParticipant.auto_assigned_statuses.second },
    { call_task_id: CallTask.second.id, participant_id: participants.pop.id, call_task_caller_id: CallTaskCaller.second.id, status: CallTaskParticipant.call_back_statuses.sample },
    { call_task_id: CallTask.second.id, participant_id: participants.pop.id, call_task_caller_id: CallTaskCaller.second.id, status: CallTaskParticipant.got_reply_statuses.sample },
    { call_task_id: CallTask.second.id, participant_id: participants.pop.id, call_task_caller_id: CallTaskCaller.second.id, status: CallTaskParticipant.never_contact_statuses.sample, caller_comment: 'freak' },
  ])
end
