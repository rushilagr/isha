require 'rails_helper'

RSpec.describe "participant_attendances/new", type: :view do
  before(:each) do
    assign(:participant_attendance, ParticipantAttendance.new(
      :program_participant => nil,
      :batch => "MyString"
    ))
  end

  it "renders new participant_attendance form" do
    render

    assert_select "form[action=?][method=?]", participant_attendances_path, "post" do

      assert_select "input[name=?]", "participant_attendance[program_participant_id]"

      assert_select "input[name=?]", "participant_attendance[batch]"
    end
  end
end
