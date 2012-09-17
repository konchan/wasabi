require "spec_helper"

describe AccuraciesController do
  describe "routing" do

    it "routes to #index" do
      get("/accuracies").should route_to("accuracies#index")
    end

    it "routes to #new" do
      get("/accuracies/new").should route_to("accuracies#new")
    end

    it "routes to #show" do
      get("/accuracies/1").should route_to("accuracies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/accuracies/1/edit").should route_to("accuracies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/accuracies").should route_to("accuracies#create")
    end

    it "routes to #update" do
      put("/accuracies/1").should route_to("accuracies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/accuracies/1").should route_to("accuracies#destroy", :id => "1")
    end

  end
end
