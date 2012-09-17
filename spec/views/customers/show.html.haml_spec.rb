require 'spec_helper'

describe "customers/show" do
  before(:each) do
    @customer = assign(:customer, stub_model(Customer,
      :code => "Code",
      :name => "Name",
      :address => "Address",
      :url => "Url",
      :counter => 1,
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    rendered.should match(/Name/)
    rendered.should match(/Address/)
    rendered.should match(/Url/)
    rendered.should match(/1/)
    rendered.should match(/Description/)
  end
end
