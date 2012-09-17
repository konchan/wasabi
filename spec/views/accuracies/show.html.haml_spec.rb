require 'spec_helper'

describe "accuracies/show" do
  before(:each) do
    @accuracy = assign(:accuracy, stub_model(Accuracy,
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
