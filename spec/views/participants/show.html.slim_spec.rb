require 'rails_helper'

RSpec.describe "participants/show", type: :view do
  before(:each) do
    @participant = assign(:participant, Participant.create!(
      :name => "Name",
      :phone => "Phone",
      :email => "Email",
      :pincode => "Pincode",
      :gender => "Gender",
      :occupation => "Occupation",
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Pincode/)
    expect(rendered).to match(/Gender/)
    expect(rendered).to match(/Occupation/)
    expect(rendered).to match(//)
  end
end
