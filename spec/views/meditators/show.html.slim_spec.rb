require 'rails_helper'

RSpec.describe "meditators/show", type: :view do
  before(:each) do
    @meditator = assign(:meditator, Meditator.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
