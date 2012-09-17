require 'spec_helper'

describe "actions/index" do
  before(:each) do
    assign(:actions, [
      stub_model(Action,
        :name => "Name",
        :number => 1,
        :detail => "Detail"
      ),
      stub_model(Action,
        :name => "Name",
        :number => 1,
        :detail => "Detail"
      )
    ])
  end

  it "renders a list of actions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Detail".to_s, :count => 2
  end
end
