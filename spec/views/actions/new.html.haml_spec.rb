require 'spec_helper'

describe "actions/new" do
  before(:each) do
    assign(:action, stub_model(Action,
      :name => "MyString",
      :number => 1,
      :detail => "MyString"
    ).as_new_record)
  end

  it "renders new action form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => actions_path, :method => "post" do
      assert_select "input#action_name", :name => "action[name]"
      assert_select "input#action_number", :name => "action[number]"
      assert_select "input#action_detail", :name => "action[detail]"
    end
  end
end
