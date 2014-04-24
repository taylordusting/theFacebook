require 'spec_helper'

describe "Friends" do 

	subject { page }
    let(:user) { FactoryGirl.create(:user) }
    before {sign_in user}
    #visit user_path(user) 
    
    it {should have_title(user.name)}
    it {should have_content("Friend Requests")}
    it {should have_content("My Friends")}

end