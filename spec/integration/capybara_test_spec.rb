require 'spec_helper'
require 'capybara/rspec'

describe 'home page' do
  it 'welcomes the user' do
    visit '/'
    expect(page).to have_content 'Hello, Rails!'
  end
end

describe 'articles' do
  context 'creating an article' do
    it 'successfully creates' do
      visit '/articles/new'
      fill_in 'Title', :with => "A very good title"
      fill_in 'Text', :with => "A very good text content"
      find('input[name="commit"]').click
      expect(page).to have_content 'Comments'
    end
  end
end
