require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Sign up'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sign Up')
    end

    it "should have the title 'Mentor Mentored'" do
    	visit '/static_pages/home'
    	expect(page).to have_title("Mentor Mentored")
    end	
  end
end