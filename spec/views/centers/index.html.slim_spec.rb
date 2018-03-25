require 'rails_helper'

RSpec.describe "centers/index", type: :view do
  before(:each) do
    assign(:centers, [
      Center.create!(),
      Center.create!()
    ])
  end

  it "renders a list of centers" do
    render
  end
end
