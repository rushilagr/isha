require 'rails_helper'

RSpec.describe "meditators/edit", type: :view do
  before(:each) do
    @meditator = assign(:meditator, Meditator.create!())
  end

  it "renders the edit meditator form" do
    render

    assert_select "form[action=?][method=?]", meditator_path(@meditator), "post" do
    end
  end
end
