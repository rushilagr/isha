require 'rails_helper'

RSpec.describe "call_tasks/edit", type: :view do
  before(:each) do
    @call_task = assign(:call_task, CallTask.create!())
  end

  it "renders the edit call_task form" do
    render

    assert_select "form[action=?][method=?]", call_task_path(@call_task), "post" do
    end
  end
end
