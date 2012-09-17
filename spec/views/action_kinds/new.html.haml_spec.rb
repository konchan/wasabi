require 'spec_helper'

describe "action_kinds/new" do
  before(:each) do
    assign(:action_kind, stub_model(ActionKind,
      :name => "MyString",
      :design => "MyString"
    ).as_new_record)
  end

  it "renders new action_kind form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => action_kinds_path, :method => "post" do
      assert_select "input#action_kind_name", :name => "action_kind[name]"
      assert_select "input#action_kind_design", :name => "action_kind[design]"
    end
  end
end
