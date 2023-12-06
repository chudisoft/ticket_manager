require 'rails_helper'

RSpec.describe 'Booking', type: :model do
  Rails.application.routes.default_url_options[:host] = 'localhost:3000'

  let(:user) { User.new(fname: 'admin user', email: 'user@example.com', password: 'password') }
  let(:event) do
    Event.new(name: 'Bread', icon: 'https//a.com', user:)
  end
  let(:booking) { Booking.new(name: 'Flour', amount: 20, author_id: user.id, event_ids: [event.id]) }

  before { user.save }
  before { event.save }
  before { booking.save }

  context 'validity' do
    it 'is valid when all attributes are present' do
      expect(booking).to be_valid
    end
  end

  context 'invalidity' do
    it 'is not valid when name is not present' do
      booking.name = nil
      expect(booking).not_to be_valid
    end

    it 'is not valid when amount is less than or equal to zero' do
      booking.amount = 0
      expect(booking).not_to be_valid
    end
  end
end
