require 'spec_helper'

describe "topics/show.html.erb" do
  before(:each) do
    @topic = assign(:topic, stub_model(Topic,
      :title => "Title",
      :content => "MyText",
      :user => "",
      :category => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
