require "rails_helper"

RSpec.describe WorkflowsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/workflows").to route_to("workflows#index")
    end

    it "routes to #show" do
      expect(get: "/workflows/1").to route_to("workflows#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/workflows").to route_to("workflows#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/workflows/1").to route_to("workflows#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/workflows/1").to route_to("workflows#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/workflows/1").to route_to("workflows#destroy", id: "1")
    end
  end
end
