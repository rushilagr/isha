require 'rails_helper'

RSpec.describe "participant_attendances/edit", type: :view do
  before(:each) do
    @participant_attendance = assign(:participant_attendance, ParticipantAttendance.create!(
      :program_participant => nil,
      :batch => "MyString"
    ))
  end

  it "renders the edit participant_attendance form" do
    render

    assert_select "form[action=?][method=?]", participant_attendance_path(@participant_attendance), "post" do

      assert_select "input[name=?]", "participant_attendance[program_participant_id]"

      assert_select "input[name=?]", "participant_attendance[batch]"
    end
  end
end
