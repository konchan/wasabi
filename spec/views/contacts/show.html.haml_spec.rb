require 'spec_helper'

describe "contacts/show" do
  before(:each) do
    @contact = assign(:contact, stub_model(Contact,
      :name => "Name",
      :title => "Title",
      :affiliation => "Affiliation",
      :email => "Email",
      :phone => "Phone",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Title/)
    rendered.should match(/Affiliation/)
    rendered.should match(/Email/)
    rendered.should match(/Phone/)
    rendered.should match(/Description/)
  end
end
