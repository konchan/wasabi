require 'spec_helper'

describe "kinds/index" do
  before(:each) do
    assign(:kinds, [
      stub_model(Kind,
        :name => "Name",
        :design => "Design"
      ),
      stub_model(Kind,
        :name => "Name",
        :design => "Design"
      )
    ])
  end

  it "renders a list of kinds" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Design".to_s, :count => 2
  end
end
