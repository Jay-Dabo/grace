require 'rails_helper'

RSpec.describe "Givings", type: :request do
  describe "GET /givings" do
    it "works! (now write some real specs)" do
      get givings_path
      expect(response).to have_http_status(200)
    end
  end
end
