require 'spec_helper'

describe "actions/edit" do
  before(:each) do
    @action = assign(:action, stub_model(Action,
      :name => "MyString",
      :number => 1,
      :detail => "MyString"
    ))
  end

  it "renders the edit action form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => actions_path(@action), :method => "post" do
      assert_select "input#action_name", :name => "action[name]"
      assert_select "input#action_number", :name => "action[number]"
      assert_select "input#action_detail", :name => "action[detail]"
    end
  end
end
