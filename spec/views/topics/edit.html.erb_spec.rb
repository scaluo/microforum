require 'spec_helper'

describe "topics/edit.html.erb" do
  before(:each) do
    @topic = assign(:topic, stub_model(Topic,
      :title => "MyString",
      :content => "MyText",
      :user => "",
      :category => ""
    ))
  end

  it "renders the edit topic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => topics_path(@topic), :method => "post" do
      assert_select "input#topic_title", :name => "topic[title]"
      assert_select "textarea#topic_content", :name => "topic[content]"
      assert_select "input#topic_user", :name => "topic[user]"
      assert_select "input#topic_category", :name => "topic[category]"
    end
  end
end
