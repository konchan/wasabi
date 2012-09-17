require "spec_helper"

describe ActionKindsController do
  describe "routing" do

    it "routes to #index" do
      get("/action_kinds").should route_to("action_kinds#index")
    end

    it "routes to #new" do
      get("/action_kinds/new").should route_to("action_kinds#new")
    end

    it "routes to #show" do
      get("/action_kinds/1").should route_to("action_kinds#show", :id => "1")
    end

    it "routes to #edit" do
      get("/action_kinds/1/edit").should route_to("action_kinds#edit", :id => "1")
    end

    it "routes to #create" do
      post("/action_kinds").should route_to("action_kinds#create")
    end

    it "routes to #update" do
      put("/action_kinds/1").should route_to("action_kinds#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/action_kinds/1").should route_to("action_kinds#destroy", :id => "1")
    end

  end
end
