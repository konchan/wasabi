require 'spec_helper'

describe "phases/new" do
  before(:each) do
    assign(:phase, stub_model(Phase,
      :name => "MyString",
      :design => "MyString"
    ).as_new_record)
  end

  it "renders new phase form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => phases_path, :method => "post" do
      assert_select "input#phase_name", :name => "phase[name]"
      assert_select "input#phase_design", :name => "phase[design]"
    end
  end
end
