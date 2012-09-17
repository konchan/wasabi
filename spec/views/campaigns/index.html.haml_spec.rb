require 'spec_helper'

describe "campaigns/index" do
  before(:each) do
    assign(:campaigns, [
      stub_model(Campaign,
        :name => "Name",
        :code => "Code",
        :counter => 1,
        :amount => "Amount",
        :description => "Description"
      ),
      stub_model(Campaign,
        :name => "Name",
        :code => "Code",
        :counter => 1,
        :amount => "Amount",
        :description => "Description"
      )
    ])
  end

  it "renders a list of campaigns" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Amount".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
