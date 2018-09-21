require 'rails_helper'

RSpec.describe "call_tasks/index", type: :view do
  before(:each) do
    assign(:call_tasks, [
      CallTask.create!(),
      CallTask.create!()
    ])
  end

  it "renders a list of call_tasks" do
    render
  end
end
