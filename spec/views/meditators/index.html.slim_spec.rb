require 'rails_helper'

RSpec.describe "meditators/index", type: :view do
  before(:each) do
    assign(:meditators, [
      Meditator.create!(),
      Meditator.create!()
    ])
  end

  it "renders a list of meditators" do
    render
  end
end
