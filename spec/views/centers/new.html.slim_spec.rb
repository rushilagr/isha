require 'rails_helper'

RSpec.describe "centers/new", type: :view do
  before(:each) do
    assign(:center, Center.new())
  end

  it "renders new center form" do
    render

    assert_select "form[action=?][method=?]", centers_path, "post" do
    end
  end
end
