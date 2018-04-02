json.extract! participant, :id, :name, :phone, :email, :pincode, :gender, :occupation, :city_id, :created_at, :updated_at
json.url participant_url(participant, format: :json)
