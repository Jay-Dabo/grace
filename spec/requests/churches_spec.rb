require 'rails_helper'

RSpec.describe "Churches", type: :request do
  describe "GET /churches" do
    it "works! (now write some real specs)" do
      get churches_path
      expect(response).to have_http_status(200)
    end
  end
end
