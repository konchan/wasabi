require 'spec_helper'

describe "action_kinds/show" do
  before(:each) do
    @action_kind = assign(:action_kind, stub_model(ActionKind,
      :name => "Name",
      :design => "Design"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Design/)
  end
end
