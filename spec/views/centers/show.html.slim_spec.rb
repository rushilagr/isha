require 'rails_helper'

RSpec.describe "centers/show", type: :view do
  before(:each) do
    @center = assign(:center, Center.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
