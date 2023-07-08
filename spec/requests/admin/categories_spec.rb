require 'rails_helper'

RSpec.describe "Admin::Categories", type: :request do
  describe "GET /parent" do
    it "returns http success" do
      get "/admin/categories/parent"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /Admin" do
    it "returns http success" do
      get "/admin/categories/Admin"
      expect(response).to have_http_status(:success)
    end
  end

end
