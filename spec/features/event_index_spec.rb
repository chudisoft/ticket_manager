require 'rails_helper'

RSpec.describe 'Event index', type: :feature do
  Rails.application.routes.default_url_options[:host] = 'localhost:3000'
  let(:user) { User.new(fname: 'admin user', email: 'user@example.com', password: 'password') }
  let(:event) { Event.new(name: 'Flour', icon: 'https://', user:) }

  before { user.save }
  before { event.save }

  before(:each) do
    visit new_user_session_path
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit events_path
  end

  describe 'event index' do
    it 'shows a list of events' do
      expect(page).to have_content('New Event')
      user.events.each do |event|
        expect(page).to have_content(event.name)
      end
    end
  end
end

RSpec.describe 'Event New', type: :feature do
  Rails.application.routes.default_url_options[:host] = 'localhost:3000'
  let(:user) { User.new(fname: 'admin user', email: 'user@example.com', password: 'password') }
  let(:event) { Event.new(name: 'Flour', icon: 'https://', user:) }

  before { user.save }
  before { event.save }

  before(:each) do
    visit new_user_session_path
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit events_path
  end

  describe 'Click events' do
    it 'navigates to the new event page' do
      # puts page.body
      click_on 'Add Event'
      expect(page).to have_current_path(new_event_path)
      expect(page).to have_content('Name')
    end
  end
end
