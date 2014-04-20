require 'spec_helper'

describe "wallposts/edit" do
  before(:each) do
    @wallpost = assign(:wallpost, stub_model(Wallpost,
      :content => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit wallpost form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", wallpost_path(@wallpost), "post" do
      assert_select "input#wallpost_content[name=?]", "wallpost[content]"
      assert_select "input#wallpost_user_id[name=?]", "wallpost[user_id]"
    end
  end
end
