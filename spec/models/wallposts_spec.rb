require 'spec_helper'

describe Wallpost do

  let(:user) { FactoryGirl.create(:user) }
  let(:friend) { FactoryGirl.create(:friend) }
  before do
    # This code is not idiomatically correct.
    @wallpost = Wallpost.new(content: "This is a Wall Post", user_id: user.id, friend_id: friend.id)
  end

  subject { @wallpost }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }
  it { should respond_to(:friend_id) }
  it { should respond_to(:friend) }
  its(:friend) { should eq friend }

  it {should be_valid}

  describe "when user_id is not present" do
    before { @wallpost.user_id = nil }
    it { should_not be_valid }
  end

  describe "when friend_id is not present" do
    before { @wallpost.friend_id = nil }
    it { should_not be_valid }
  end

    describe "with blank content" do
    before { @wallpost.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @wallpost.content = "a" * 141 }
    it { should_not be_valid }
  end
end