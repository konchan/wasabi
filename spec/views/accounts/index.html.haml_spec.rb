require 'spec_helper'

describe "accounts/index" do
  before(:each) do
    assign(:accounts, [
      stub_model(Account,
        :name => "Name",
        :identifier_url => "Identifier Url",
        :email => "Email",
        :role => "Role",
        :uid => "Uid"
      ),
      stub_model(Account,
        :name => "Name",
        :identifier_url => "Identifier Url",
        :email => "Email",
        :role => "Role",
        :uid => "Uid"
      )
    ])
  end

  it "renders a list of accounts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Identifier Url".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Role".to_s, :count => 2
    assert_select "tr>td", :text => "Uid".to_s, :count => 2
  end
end
