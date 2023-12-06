require 'rails_helper'

RSpec.describe 'Booking index', type: :feature do
  Rails.application.routes.default_url_options[:host] = 'localhost:3000'
  let(:user) { User.new(fname: 'admin user', email: 'user@example.com', password: 'password') }
  let(:event) { Event.new(name: 'Flour', icon: 'https://', user:) }
  let(:booking) do
    Booking.new(name: 'Bread', amount: 30, author_id: user.id)
  end

  before { user.save }
  before { event.save }
  before { booking.save }

  before(:each) do
    visit new_user_session_path
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit event_bookings_path(event_id: event.id)
  end

  describe 'booking index' do
    it 'shows a list of bookings' do
      expect(page).to have_content('New Booking')
      event.bookings.each do |booking|
        expect(page).to have_content(booking.name)
      end
    end
  end
end
