require 'spec_helper'

describe "customers/new" do
  before(:each) do
    assign(:customer, stub_model(Customer,
      :code => "MyString",
      :name => "MyString",
      :address => "MyString",
      :url => "MyString",
      :counter => 1,
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new customer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => customers_path, :method => "post" do
      assert_select "input#customer_code", :name => "customer[code]"
      assert_select "input#customer_name", :name => "customer[name]"
      assert_select "input#customer_address", :name => "customer[address]"
      assert_select "input#customer_url", :name => "customer[url]"
      assert_select "input#customer_counter", :name => "customer[counter]"
      assert_select "input#customer_description", :name => "customer[description]"
    end
  end
end
