require 'spec_helper'

describe "kinds/show" do
  before(:each) do
    @kind = assign(:kind, stub_model(Kind,
      :name => "Name",
      :design => "Design"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Design/)
  end
end
