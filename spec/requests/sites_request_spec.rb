require 'spec_helper'

describe "Sites Authentication", :type => :request do
  it_should_behave_like("accessible by login only", :sites_path)
end

describe "Creating a Site" do
  let(:user) { create(:user) }

  before { sign_in user }

  it "should have a new action" do
    visit '/sites/new'
    page.should have_content 'new site'
  end

  it "should allow a user to create a site" do
    visit '/sites/new'
    fill_in 'site[endpoint]', :with => 'foo.example.com'
    fill_in 'site[frequency]', :with => '5'
    check 'site[enabled]'
    click_button 'Create Site'
    current_path.should == sites_path
    page.should have_content 'successfully created'
  end
end

describe "Editing a Site" do
  let!(:site) { create(:site) }

  it "should have a edit action" do
    visit edit_site_path(site)
    find_field('site[endpoint]').value.should == site.endpoint
  end
end
