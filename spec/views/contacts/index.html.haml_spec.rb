require 'spec_helper'

describe "contacts/index" do
  before(:each) do
    assign(:contacts, [
      stub_model(Contact,
        :name => "Name",
        :title => "Title",
        :affiliation => "Affiliation",
        :email => "Email",
        :phone => "Phone",
        :description => "Description"
      ),
      stub_model(Contact,
        :name => "Name",
        :title => "Title",
        :affiliation => "Affiliation",
        :email => "Email",
        :phone => "Phone",
        :description => "Description"
      )
    ])
  end

  it "renders a list of contacts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Affiliation".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
