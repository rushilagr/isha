# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

City.create([{name: 'Delhi'}])
City.create([{name: 'Noida'}])

Center.create([{city_id: 1, name: 'South Delhi'}])
Center.create([{city_id: 2, name: 'Greater Noida'}])

User.create([{ name: 'Rushil Agrawal', phone: '9886477775', city_id: 1, password: 'asdasdasd' }])
User.create([{ name: 'Rohan C', phone: '1234123412', city_id: 1, password: 'asdasdasd' }])

Program.create([{"starts_at(1i)"=>"2018", "starts_at(2i)"=>"3", "starts_at(3i)"=>"26", "ends_at(1i)"=>"2018", "ends_at(2i)"=>"5", "ends_at(3i)"=>"25", "length"=>"2", "batches"=>["Morning", 'Evening'], "teachers"=>"Arundhati", "center_id"=>"1", "status"=>"pending", "user_id"=>"1"}])