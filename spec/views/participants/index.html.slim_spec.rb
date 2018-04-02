require 'rails_helper'

RSpec.describe "participants/index", type: :view do
  before(:each) do
    assign(:participants, [
      Participant.create!(
        :name => "Name",
        :phone => "Phone",
        :email => "Email",
        :pincode => "Pincode",
        :gender => "Gender",
        :occupation => "Occupation",
        :city => nil
      ),
      Participant.create!(
        :name => "Name",
        :phone => "Phone",
        :email => "Email",
        :pincode => "Pincode",
        :gender => "Gender",
        :occupation => "Occupation",
        :city => nil
      )
    ])
  end

  it "renders a list of participants" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Pincode".to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    assert_select "tr>td", :text => "Occupation".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
