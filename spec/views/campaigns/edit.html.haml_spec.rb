require 'spec_helper'

describe "campaigns/edit" do
  before(:each) do
    @campaign = assign(:campaign, stub_model(Campaign,
      :name => "MyString",
      :code => "MyString",
      :counter => 1,
      :amount => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit campaign form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => campaigns_path(@campaign), :method => "post" do
      assert_select "input#campaign_name", :name => "campaign[name]"
      assert_select "input#campaign_code", :name => "campaign[code]"
      assert_select "input#campaign_counter", :name => "campaign[counter]"
      assert_select "input#campaign_amount", :name => "campaign[amount]"
      assert_select "input#campaign_description", :name => "campaign[description]"
    end
  end
end
