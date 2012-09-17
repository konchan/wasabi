require 'spec_helper'

describe "accounts/new" do
  before(:each) do
    assign(:account, stub_model(Account,
      :name => "MyString",
      :identifier_url => "MyString",
      :email => "MyString",
      :role => "MyString",
      :uid => "MyString"
    ).as_new_record)
  end

  it "renders new account form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => accounts_path, :method => "post" do
      assert_select "input#account_name", :name => "account[name]"
      assert_select "input#account_identifier_url", :name => "account[identifier_url]"
      assert_select "input#account_email", :name => "account[email]"
      assert_select "input#account_role", :name => "account[role]"
      assert_select "input#account_uid", :name => "account[uid]"
    end
  end
end
