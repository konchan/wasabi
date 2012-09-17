require 'spec_helper'

describe "action_kinds/edit" do
  before(:each) do
    @action_kind = assign(:action_kind, stub_model(ActionKind,
      :name => "MyString",
      :design => "MyString"
    ))
  end

  it "renders the edit action_kind form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => action_kinds_path(@action_kind), :method => "post" do
      assert_select "input#action_kind_name", :name => "action_kind[name]"
      assert_select "input#action_kind_design", :name => "action_kind[design]"
    end
  end
end
