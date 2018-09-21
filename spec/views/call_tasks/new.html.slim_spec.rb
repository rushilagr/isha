require 'rails_helper'

RSpec.describe "call_tasks/new", type: :view do
  before(:each) do
    assign(:call_task, CallTask.new())
  end

  it "renders new call_task form" do
    render

    assert_select "form[action=?][method=?]", call_tasks_path, "post" do
    end
  end
end
