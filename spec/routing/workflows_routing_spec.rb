require "rails_helper"

RSpec.describe WorkflowsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/workflow").to route_to("workflows#index", format: 'json')
    end

    it "routes to #show" do
      expect(get: "/workflow/1").to route_to("workflows#show", id: "1", format: 'json')
    end


    it "routes to #create" do
      expect(post: "/workflow").to route_to("workflows#create", format: 'json')
    end

    it "routes to #update via PUT" do
      expect(put: "/workflow/1").to route_to("workflows#update", id: "1", format: 'json')
    end

    it "routes to #update via PATCH" do
      expect(patch: "/workflow/1").to route_to("workflows#update", id: "1", format: 'json')
    end
  end
end
