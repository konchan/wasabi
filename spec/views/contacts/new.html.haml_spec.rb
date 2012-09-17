require 'spec_helper'

describe "contacts/new" do
  before(:each) do
    assign(:contact, stub_model(Contact,
      :name => "MyString",
      :title => "MyString",
      :affiliation => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new contact form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => contacts_path, :method => "post" do
      assert_select "input#contact_name", :name => "contact[name]"
      assert_select "input#contact_title", :name => "contact[title]"
      assert_select "input#contact_affiliation", :name => "contact[affiliation]"
      assert_select "input#contact_email", :name => "contact[email]"
      assert_select "input#contact_phone", :name => "contact[phone]"
      assert_select "input#contact_description", :name => "contact[description]"
    end
  end
end
