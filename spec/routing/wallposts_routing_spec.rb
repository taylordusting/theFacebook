require "spec_helper"

describe WallpostsController do
  describe "routing" do

    it "routes to #index" do
      get("/wallposts").should route_to("wallposts#index")
    end

    it "routes to #new" do
      get("/wallposts/new").should route_to("wallposts#new")
    end

    it "routes to #show" do
      get("/wallposts/1").should route_to("wallposts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/wallposts/1/edit").should route_to("wallposts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/wallposts").should route_to("wallposts#create")
    end

    it "routes to #update" do
      put("/wallposts/1").should route_to("wallposts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/wallposts/1").should route_to("wallposts#destroy", :id => "1")
    end

  end
end
