shared_examples "accessible by login" do |url|
  let(:url_path) { send(url) }
  let(:user) { create(:user) }

  context "not logged in" do
    it "redirects to the login page with error" do
      visit url_path
      current_path.should == login_path
      page.should have_selector('.alert-error')
    end
  end

  context "logged in" do
    it "displays the page without errors" do
      sign_in user
      visit url_path
      current_path.should == url_path
      page.should_not have_selector('.alert-error')
    end
  end
end
