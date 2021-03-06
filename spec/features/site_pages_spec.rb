require 'spec_helper'

describe "Site pages" do
  subject { page }

  it "should have the right links on the layout" do
    visit root_path
    click_link "Home"
    page.should have_title('ImpactStarter')
    page.should_not have_title(full_title('Home'))
    click_link "About"
    page.should have_title(full_title('About'))
    click_link "FAQs"
    page.should have_title(full_title('FAQs'))
    click_link "Terms"
    page.should have_title(full_title('Terms and Conditions'))
    click_link "Privacy"
    page.should have_title(full_title('Privacy'))
    # click_link "Join us"
    # page.should have_title(full_title('Create Account'))
    first(:link, "Sign in").click
    page.should have_title(full_title('Sign In'))
    #click_link("Start A Project")
    #page.should have_title(full_title('Start A Project'))
  end

  describe "Home page" do
    before { visit root_path }

    it "should have the correct title" do
      page.should have_title('ImpactStarter')
    end
  end

  describe "About page" do
    before { visit about_path }

    it "should have the correct title" do
      page.should have_title(full_title('About'))
    end

    it "should have the interior header" do
      page.should have_selector('div.interior-upper')
    end

    it "should have working links in sidebar" do
      click_link "what are social impact bonds"
      page.should have_selector('div#default-content')
      click_link "how do I start a project"
      page.should have_selector('div#start-project')
      click_link "how do I invest"
      page.should have_selector('div#invest-project')
      click_link "how do you make money"
      page.should have_selector('div#return-project')
    end

  end

  describe "FAQs page" do
      before { visit faqs_path }

      it "should have the correct title" do
        page.should have_title(full_title('FAQs'))
      end
  end

  describe "Terms page" do
    before { visit terms_path }

    it "should have the correct title" do
      page.should have_title(full_title('Terms and Conditions'))
    end

    it "should have the correct heading" do
      page.should have_selector('h1', text: 'Terms and Conditions')
    end

  end

  describe "Privacy page" do
    before { visit privacy_path }

    it "should have the correct title" do
      page.should have_title(full_title('Privacy Statement'))
    end

    it "should have the correct heading" do
      page.should have_selector('h1', text: 'Privacy Statement')
    end
  end

end
