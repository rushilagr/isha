require 'rails_helper'

RSpec.describe "call_tasks/show", type: :view do
  before(:each) do
    @call_task = assign(:call_task, CallTask.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
