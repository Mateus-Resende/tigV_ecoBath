require 'rails_helper'

RSpec.describe "Baths", type: :request do
  describe "GET /baths" do
    it "works! (now write some real specs)" do
      get baths_path
      expect(response).to have_http_status(200)
    end
  end
end
