include PaymentsHelper

# This Class handles operations related to Booking
class Payment < ApplicationRecord
  belongs_to :booking
  enum method: {
    credit_card: 'Credit Card',
    bank_transfers: 'Bank Transfers',
    crypto: 'Crypto',
    cash: 'Cash'
  }
  validates :transaction_id, presence: true, length: { minimum: 3 }
  validates :currency, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :comments, allow_blank: true
  # validates :method, presence: true, inclusion: { in: ['Credit Card', 'Bank Transfers', 'Crypto', 'Cash'] }
  validates :method, presence: true, inclusion: { in: method }
end
