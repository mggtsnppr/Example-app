require 'spec_helper'

describe "Static pages" do

  shared_examples_for "all static pages" do |heading, page_title|
    it { should have_selector('h1',    text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1',    text: 'Example App') }
    it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector 'title', text: '| Home' }
  end

  describe "Help page" do
    before { visit help_path }

    it_should_behave_like "all static pages", 'Help', 'Help'
  end

  describe "About page" do
    before { visit about_path }

    it_should_behave_like "all static pages", 'About', 'About Us'
  end

  describe "Contact page" do
    before { visit contact_path }

    it_should_behave_like "all static pages", 'Contact Us', 'Contact'
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    should have_selector 'title', text: full_title('About Us')
    click_link "Help"
    should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    should have_selector 'title', text: full_title('Contact')
    click_link "Home"
    click_link "Sign up now!"
    should have_selector 'title', text: full_title('Sign up')
    click_link "example app"
    should have_selector('title', text: full_title(''))
  end
end