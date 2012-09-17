require 'spec_helper'

describe "actions/show" do
  before(:each) do
    @action = assign(:action, stub_model(Action,
      :name => "Name",
      :number => 1,
      :detail => "Detail"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/Detail/)
  end
end
