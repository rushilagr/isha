require 'rails_helper'

RSpec.describe "centers/edit", type: :view do
  before(:each) do
    @center = assign(:center, Center.create!())
  end

  it "renders the edit center form" do
    render

    assert_select "form[action=?][method=?]", center_path(@center), "post" do
    end
  end
end
