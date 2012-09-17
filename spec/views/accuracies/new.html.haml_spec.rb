require 'spec_helper'

describe "accuracies/new" do
  before(:each) do
    assign(:accuracy, stub_model(Accuracy,
      :name => "MyString",
      :design => "MyString"
    ).as_new_record)
  end

  it "renders new accuracy form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => accuracies_path, :method => "post" do
      assert_select "input#accuracy_name", :name => "accuracy[name]"
      assert_select "input#accuracy_design", :name => "accuracy[design]"
    end
  end
end
