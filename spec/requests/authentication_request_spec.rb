require 'spec_helper'

describe "logging in" do

  let(:user) { create(:user) }

  context "with a valid login" do

    before { sign_in user }

    it 'should redirect the user to ...' do
      expect(page).to have_content('Logged In Successfully')
    end
  end


  context "with an invalid login" do

    before do
      user.password = 'incorrect password'
      sign_in user
    end

    it 'should render new' do
      expect(page).to have_content('Invalid email or password')
    end
  end
end

