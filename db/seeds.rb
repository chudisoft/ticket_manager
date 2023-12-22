# frozen_string_literal: true
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Use SecureRandom.uuid to generate UUIDs
User.create(id: SecureRandom.uuid, email: 'admin@chudisoft.com', password: 'Admin_2023', fname: 'Admin Account', role: :admin, status: :active)
User.create(id: SecureRandom.uuid, email: 'user@chudisoft.com', password: 'User_2023', fname: 'User Account', role: :member, status: :active)
User.create(id: SecureRandom.uuid, email: 'user1@chudisoft.com', password: 'User_2023', fname: 'User Account', role: :guest, status: :active)

# User.find_or_create(email: 'admin@chudisoft.com', password: 'Admin_2023', fname: 'Admin Account', role: :admin)
# User.find_or_create(email: 'user@chudisoft.com', password: 'User_2023', fname: 'User Account', role: :member)
# User.find_or_create(email: 'user@chudisoft.com', password: 'User_2023', fname: 'User Account', role: :guest)
