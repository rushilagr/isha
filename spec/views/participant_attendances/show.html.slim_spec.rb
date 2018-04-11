require 'rails_helper'

RSpec.describe "participant_attendances/show", type: :view do
  before(:each) do
    @participant_attendance = assign(:participant_attendance, ParticipantAttendance.create!(
      :program_participant => nil,
      :batch => "Batch"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Batch/)
  end
end
