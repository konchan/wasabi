require 'spec_helper'

describe "accuracies/edit" do
  before(:each) do
    @accuracy = assign(:accuracy, stub_model(Accuracy,
      :name => "MyString",
      :design => "MyString"
    ))
  end

  it "renders the edit accuracy form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => accuracies_path(@accuracy), :method => "post" do
      assert_select "input#accuracy_name", :name => "accuracy[name]"
      assert_select "input#accuracy_design", :name => "accuracy[design]"
    end
  end
end
