module ControllerMacros
  def login_seller
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:seller]
      seller = FactoryBot.create(:seller)
      sign_in seller
    end
  end
end
