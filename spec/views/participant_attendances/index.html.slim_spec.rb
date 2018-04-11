require 'rails_helper'

RSpec.describe "participant_attendances/index", type: :view do
  before(:each) do
    assign(:participant_attendances, [
      ParticipantAttendance.create!(
        :program_participant => nil,
        :batch => "Batch"
      ),
      ParticipantAttendance.create!(
        :program_participant => nil,
        :batch => "Batch"
      )
    ])
  end

  it "renders a list of participant_attendances" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Batch".to_s, :count => 2
  end
end
