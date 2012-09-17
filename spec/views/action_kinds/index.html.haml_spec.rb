require 'spec_helper'

describe "action_kinds/index" do
  before(:each) do
    assign(:action_kinds, [
      stub_model(ActionKind,
        :name => "Name",
        :design => "Design"
      ),
      stub_model(ActionKind,
        :name => "Name",
        :design => "Design"
      )
    ])
  end

  it "renders a list of action_kinds" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Design".to_s, :count => 2
  end
end
