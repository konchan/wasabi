require 'spec_helper'

describe "accounts/show" do
  before(:each) do
    @account = assign(:account, stub_model(Account,
      :name => "Name",
      :identifier_url => "Identifier Url",
      :email => "Email",
      :role => "Role",
      :uid => "Uid"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Identifier Url/)
    rendered.should match(/Email/)
    rendered.should match(/Role/)
    rendered.should match(/Uid/)
  end
end
