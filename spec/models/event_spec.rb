require 'rails_helper'

RSpec.describe 'Event', type: :model do
  Rails.application.routes.default_url_options[:host] = 'localhost:3000'
  let(:user) { User.new(fname: 'admin user', email: 'user@example.com', password: 'password') }
  let(:event) do
    Event.new(name: 'Bread', icon: 'https//a.com', user:)
  end
  let(:booking) { Booking.new(name: 'Flour', amount: 20, author_id: user.id) }
  before { user.save }
  before { event.save }
  before { booking.save }

  context 'validity' do
    it 'is valid when all attributes are present' do
      expect(event).to be_valid
    end
  end

  context 'invalidity:' do
    it 'is not valid when name is not present' do
      event.name = nil
      expect(event).not_to be_valid
    end
  end
end
