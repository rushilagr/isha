require 'rails_helper'

RSpec.describe "participants/edit", type: :view do
  before(:each) do
    @participant = assign(:participant, Participant.create!(
      :name => "MyString",
      :phone => "MyString",
      :email => "MyString",
      :pincode => "MyString",
      :gender => "MyString",
      :occupation => "MyString",
    ))
  end

  it "renders the edit participant form" do
    render

    assert_select "form[action=?][method=?]", participant_path(@participant), "post" do

      assert_select "input[name=?]", "participant[name]"

      assert_select "input[name=?]", "participant[phone]"

      assert_select "input[name=?]", "participant[email]"

      assert_select "input[name=?]", "participant[pincode]"

      assert_select "input[name=?]", "participant[gender]"

      assert_select "input[name=?]", "participant[occupation]"

      assert_select "input[name=?]", "participant[city_id]"
    end
  end
end
