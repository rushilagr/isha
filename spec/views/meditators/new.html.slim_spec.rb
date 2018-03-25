require 'rails_helper'

RSpec.describe "meditators/new", type: :view do
  before(:each) do
    assign(:meditator, Meditator.new())
  end

  it "renders new meditator form" do
    render

    assert_select "form[action=?][method=?]", meditators_path, "post" do
    end
  end
end
