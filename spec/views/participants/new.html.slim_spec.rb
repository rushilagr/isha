require 'rails_helper'

RSpec.describe "participants/new", type: :view do
  before(:each) do
    assign(:participant, Participant.new(
      :name => "MyString",
      :phone => "MyString",
      :email => "MyString",
      :pincode => "MyString",
      :gender => "MyString",
      :occupation => "MyString",
      :city => nil
    ))
  end

  it "renders new participant form" do
    render

    assert_select "form[action=?][method=?]", participants_path, "post" do

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
