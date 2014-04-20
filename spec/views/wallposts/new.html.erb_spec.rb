require 'spec_helper'

describe "wallposts/new" do
  before(:each) do
    assign(:wallpost, stub_model(Wallpost,
      :content => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new wallpost form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", wallposts_path, "post" do
      assert_select "input#wallpost_content[name=?]", "wallpost[content]"
      assert_select "input#wallpost_user_id[name=?]", "wallpost[user_id]"
    end
  end
end
