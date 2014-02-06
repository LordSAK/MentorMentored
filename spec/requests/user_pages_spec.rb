require 'spec_helper'

describe "UserPages" do

	subject { page }
    
    describe "signup page" do
    	before { visit signup_path }

    	it { should have_content('Sign up') }
    	# Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    	it { should have_title(full_title('Sign up')) }
  end
end
